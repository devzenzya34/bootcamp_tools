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


module "security_group" {
  source = "../modules/securitygroup"
  sg_name = var.security_group_name
  sg_tag = var.security_group_tag
}

module "ec2" {
  source = "../modules/ec2"
  instance_tag = var.instance_tag
  user = var.user
  instance_type = var.instance_type
  key_name = var.key_name
  security_group_name = var.security_group_name
}

module "eip" {
  source = "../modules/eip"
  eip_tag = var.eip_tag
}

module "ebs" {
  source = "../modules/ebs"
  ebs_tag = var.ebs_tag
  ebs_size = var.ebs_size
  availability_zone = var.availability_zone
}

resource "aws_eip_association" "eip_association" {
  instance_id = module.ec2.instance_id
  allocation_id = module.eip.eip_allocation_id
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.ebs_volume_id
  instance_id = module.ec2.instance_id
}