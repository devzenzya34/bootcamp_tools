data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  tags          = var.tags
  security_groups = ["${var.security_group_name}"]
  key_name      = var.key_name

  provisionner "remote_exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
    ]
    connection {
      type        = "ssh"
      user        = var.user
      host        = self.public_ip
      private_key = file("../app/files/${var.key_name}.pem")
    }
  }

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
    encrypted = true
    delete_on_termination = true
  }
}