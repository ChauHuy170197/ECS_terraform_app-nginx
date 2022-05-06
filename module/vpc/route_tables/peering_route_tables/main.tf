##############################################
# Peering Route Table
##############################################
resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  route {
    destination_cidr_block = var.default_internet_cidr_block
    gateway_id             = var.gateway_id
  }
  route {
    source_cidr_block         = var.source_cidr_block
    vpc_peering_connection_id = var.vpc_peering_connection_id
  }

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
    var.route_table_tags,
  )
}