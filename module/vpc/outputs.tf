output "vpc_id" {
  value = aws_vpc.this.id
}
output "cidr_block" {
  value = aws_vpc.this.cidr_block
}
output "vpc_default_security_group_id" {
  value       = join("", aws_vpc.this.*.default_security_group_id)
  description = "The ID of the security group created by default on VPC creation"
}
