variable "launch_configuration" {
  type = string
}
variable "min_size" {
  type = string
}
variable "max_size" {
  type = string
}
variable "desired_capacity" {
  type = string
}
variable "health_check_type" {
  type = string
}
variable "vpc_zone_identifier" {
  type = list(string)
}
variable "target_group_arns" {
  type = set(string)
}
