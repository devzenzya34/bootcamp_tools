resource "aws_security_group" "security_group" {
  name = var.security_group_name
  description = "Rule for terraform security group"

  ingress {
    from_port = 80
    to_port = 80
    protcol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protcol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protcol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [0.0.0.0/0]
  }

  tags = var.security_group_tag
}