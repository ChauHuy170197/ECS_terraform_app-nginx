variable "vpc_id" {
  type = string
}
output "id" {
  value = aws_internet_gateway.this.id
}