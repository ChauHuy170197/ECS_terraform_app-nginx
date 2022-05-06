variable "name" {
  description = "The name of the policy attachment"
  type        = string
  default     = ""
}

variable "roles" {
  description = "name of roles"
  type        = list(string)
  default     = []
}

variable "policy_arn" {
  description = "The arn of the policy"
  type        = string
  default     = ""
}
