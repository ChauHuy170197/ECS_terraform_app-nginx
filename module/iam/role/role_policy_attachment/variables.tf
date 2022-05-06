variable "role" {}
variable "policy_attachments" {
  type        = list(any)
  description = "(Required) Provides an IAM User."
  default     = []
}
