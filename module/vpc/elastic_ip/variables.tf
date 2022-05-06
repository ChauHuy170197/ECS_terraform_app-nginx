#--------------------------------------------------------------
# module variables
#--------------------------------------------------------------
variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "instance" {
  description = "Instance id of eip associated"
  type        = string
  default     = ""
}

variable "associate_with_private_ip" {
  description = "Mapping eip to private ip"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "eip_tags" {
  description = "Additional tags for the elastic IP"
  type        = map(string)
  default     = {}
}