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

resource "aws_internet_gateway" "name" {
  
}