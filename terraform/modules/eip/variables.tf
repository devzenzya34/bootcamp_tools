variable "eip_tag" {
  description = "The tag for elastic ip"
  type        = map
  default     = {
    Name = "eip"
  }
}