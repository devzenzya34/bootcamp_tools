variable "instance_type" {
  type = string
  default = "t2.medium"
  description = "The type for EC2 instance to start"
}

variable "key_name" {
  type = string
  default = "terraform-mini-projet"
  description = "The name of the key pair to use for SSH access to the instance"
}

variable "instance_tag" {
  type = map(string)
  default = {
    Name = "ec2"
  }
  description = "The tags to apply to the EC2 instance"
}

variable "security_group_name" {
  type        = string
  default     = "security_group"
  description = "Name of the security group"
}

variable "user" {
  type        = string
  default     = "ubuntu"
  description = "The user to connect to the EC2 instance"
}