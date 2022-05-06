resource "aws_vpc_peering_connection" "this" {
  peer_vpc_id = var.peer_vpc_id
  vpc_id      = var.vpc_id
  auto_accept = var.auto_accept
  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
    var.peering_connection_tags,
  )

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

}