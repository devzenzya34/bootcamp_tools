variable "ebs_zone" {
  type = string
  default = "us-east-1a"
  description = "The availability zone for the EBS volume"
}

variable "ebs_size" {
  type = number
  default = 8
  description = "The size of the EBS volume in GB"
}

variable "ebs_tag" {
  type = map
  default = {
    Name = "EBS Volume"
  }
  descrption = "The tags for the EBS volume"
}