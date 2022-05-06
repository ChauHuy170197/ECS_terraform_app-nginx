variable "vpc_id" {
  description = "ID of vpc"
  type        = string
}

variable "internet_cidr_block" {
  type    = string
  default = ""
}

variable "internet_gateway_id" {
  description = "Gateway ID"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "route_table_tags" {
  description = "Additional tags for route table"
  type        = map(string)
  default     = {}
}
