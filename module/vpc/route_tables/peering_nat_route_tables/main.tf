##############################################
# Peering Route Table to NAT gateway
##############################################
resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  route {
    cidr_block                = var.cidr_block_value
    vpc_peering_connection_id = var.vpc_peering_connection_id
  }
  route {
    cidr_block     = var.internet_cidr_block
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "kp-develop-ec2-bastion-rb"
  }
}