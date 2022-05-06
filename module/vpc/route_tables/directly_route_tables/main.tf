resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.internet_cidr_block
    gateway_id = var.internet_gateway_id
  }

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
    var.route_table_tags,
  )
}
