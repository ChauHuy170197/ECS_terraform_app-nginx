variable "vpc_id" {
  type = string
}
output "id" {
  value = aws_vpc_peering_connection.this.id
}