security_group_name = "mini-projet-terraform-sg"
security_group_tag  = {
    Name = "mini-projet-terraform-sg"
  }
instance_tag        = {
    Name = "ec2.project"
  }
instance_type       = "t2.medium"
key_name            = "terraform-mini-projet"
user                = "ubuntu"
ebs_zone            = "us-east-1a"
ebs_size            = "10"
ebs_tag             = {
    Name = "ebs-project"
  }
eip_tag             = {
    Name = "eip-project"
  }