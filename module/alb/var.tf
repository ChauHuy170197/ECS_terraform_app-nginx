variable "name" {
  type = string
}
variable "load_balancer_type" {
  type = string
}
variable "subnets" {
  type = list(string)
}
variable "internal" {
  type = string
}
variable "vpc_id" {
  type = string
}