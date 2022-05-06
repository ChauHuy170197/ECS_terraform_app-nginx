# Create vpc
module "vpc" {
  source               = "../module/vpc"
  cidr                 = "10.10.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_classiclink   = false

  tags = {
    Name = "Test-vpc"
  }
}

# Create the first public subnet
module "public_subnet_01" {
  source                  = "../module/vpc/subnets"
  vpc_id                  = module.vpc.vpc_id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Test-public-subnet-01"
  }
}

# Create the second public subnet
module "public_subnet_02" {
  source                  = "../module/vpc/subnets"
  vpc_id                  = module.vpc.vpc_id
  cidr_block              = "10.10.16.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Test-public-subnet-02"
  }
}

# Create the first private subnet
module "private_subnet_01" {
  source            = "../module/vpc/subnets"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = "10.10.32.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "Test-private-subnet-01"
  }
}

# Create the second private subnet
module "private_subnet_02" {
  source            = "../module/vpc/subnets"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = "10.10.48.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "Test-private-subnet-02"
  }
}

# Create internet_gateway
module "internet_gateway" {
  source = "../module/vpc/internet_gateway"
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "Test-igw"
  }
}

# Create route table for public subnet
module "rt_public" {
  source              = "../module/vpc/route_tables/directly_route_tables"
  vpc_id              = module.vpc.vpc_id
  internet_cidr_block = "0.0.0.0/0"
  internet_gateway_id = module.internet_gateway.id

  tags = {
    Name = "Test-public-rt"
  }
}

# create elastic IP for NAT Gateway
module "elastic_ip_nat_gateway" {
  source                    = "../module/vpc/elastic_ip"
  create_vpc                = true
  instance                  = ""
  associate_with_private_ip = ""
  tags = {
    Name = "Test-ngw-EIP"
  }
}

# create nat gateway for private subnet connect internet
module "nat_gateway" {
  source        = "../module/vpc/nat_gateway"
  allocation_id = module.elastic_ip_nat_gateway.id
  subnet_id     = module.public_subnet_01.id

  tags = {
    Name = "Test-ngw"
  }
}

# Create route table for private subnet
module "rt_private" {
  source              = "../module/vpc/route_tables/private_route_tables"
  vpc_id              = module.vpc.vpc_id
  internet_cidr_block = "0.0.0.0/0"
  nat_gateway_id      = module.nat_gateway.id

  tags = {
    Name = "Test-private-rt"
  }
}

# Create route table association for public subnet 01
module "public_route_table_association_01" {
  source         = "../module/vpc/route_tables/route_table_association"
  subnet_id      = module.public_subnet_01.id
  route_table_id = module.rt_public.id
}

# Create route table association for public subnet 02
module "public_route_table_association_02" {
  source         = "../module/vpc/route_tables/route_table_association"
  subnet_id      = module.public_subnet_02.id
  route_table_id = module.rt_public.id
}

# Create route table association for private subnet 01
module "private_route_table_association_01" {
  source         = "../module/vpc/route_tables/route_table_association"
  subnet_id      = module.private_subnet_01.id
  route_table_id = module.rt_private.id
}

# Create route table association for private subnet 02
module "private_route_table_association_02" {
  source         = "../module/vpc/route_tables/route_table_association"
  subnet_id      = module.private_subnet_02.id
  route_table_id = module.rt_private.id
}
