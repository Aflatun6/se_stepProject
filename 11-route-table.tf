resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "Public Route Table"
  }

}

resource "aws_route_table" "private-route-table-a" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "10.0.0.0/16"
    nat_gateway_id = aws_nat_gateway.nat-gateway-a.id
  }
  tags = {
    Name = "Private Route Table a"
  }

  depends_on = [aws_nat_gateway.nat-gateway-a]
}

resource "aws_route_table" "private-route-table-b" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "10.0.0.0/16"
    nat_gateway_id = aws_nat_gateway.nat-gateway-b.id
  }
  tags = {
    Name = "Private Route Table b"
  }

  depends_on = [aws_nat_gateway.nat-gateway-b]
}

resource "aws_route_table" "db-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    Name = "Database Route Table"
  }
}
