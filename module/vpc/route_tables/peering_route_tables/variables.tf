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
  description = "Additional tags for the route table"
  type        = map(string)
  default     = {}
}

variable "default_internet_cidr_block" {
  description = "The special IP address to public, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "destination_cidr_block" {
  description = "The CIDR block for the subnet. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "source_cidr_block" {
  description = "The CIDR block for the subnet. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "gateway_id" {
  description = "ID of Internet Gateway to attach to the VPC"
  default     = ""
}

variable "vpc_peering_connection_id" {
  description = "ID of Peering Connection"
  default     = ""
}
