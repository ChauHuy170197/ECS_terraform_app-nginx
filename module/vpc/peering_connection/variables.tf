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

variable "peering_connection_tags" {
  description = "Additional tags for the peering connection"
  type        = map(string)
  default     = {}
}

variable "peer_vpc_id" {
  description = "Peer VPC ID: string"
  type        = string
  default     = ""
}

variable "auto_accept" {
  description = "Auto accept peering connection: bool"
  type        = bool
  default     = false
}