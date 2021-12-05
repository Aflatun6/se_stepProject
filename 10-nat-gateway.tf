resource "aws_nat_gateway" "nat-gateway-a" {
  allocation_id = aws_eip.eip-a.id
  subnet_id     = aws_subnet.public-subnet-a.id
  depends_on    = [aws_internet_gateway.ig]

  tags = {
    Name = "NAT-gateway in subnet a"
  }
}

resource "aws_nat_gateway" "nat-gateway-b" {
  allocation_id = aws_eip.eip-b.id

  subnet_id  = aws_subnet.public-subnet-b.id
  depends_on = [aws_internet_gateway.ig]
  tags = {
    Name = "NAT-gateway in subnet b"
  }
}
