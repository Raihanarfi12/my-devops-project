resource "aws_vpc" "my-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Environment = "dev"
    }
}

resource "aws_subnet" "my-subnets" {
  for_each = var.subnets
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = each.value.cidr_block
  tags = {
    Name = each.key
  }
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-igw"
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "my-nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = local.public_subnet_ids[0]

  tags = {
    Name = "main-nat-gateway"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat.id
  }

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "public-rta" {
  for_each = local.public_subnet_ids
  subnet_id = aws_subnet.my-subnets[each.key].id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private-rta" {
  for_each = local.private_subnet_ids
  subnet_id = aws_subnet.my-subnets[each.key].id
  route_table_id = aws_route_table.private-rt.id
}