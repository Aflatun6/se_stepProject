resource "aws_route_table_association" "public-route-table-association-a" {
  subnet_id      = aws_subnet.public-subnet-a.id
  route_table_id = aws_route_table.public-route-table.id
  depends_on     = [aws_subnet.public-subnet-a, aws_route_table.public-route-table]
}

resource "aws_route_table_association" "public-route-table-association-b" {
  subnet_id      = aws_subnet.public-subnet-b.id
  route_table_id = aws_route_table.public-route-table.id
  depends_on     = [aws_subnet.public-subnet-b, aws_route_table.public-route-table]

}

resource "aws_route_table_association" "private-route-table-association-a" {
  subnet_id      = aws_subnet.private-subnet-a.id
  route_table_id = aws_route_table.private-route-table-a.id
  depends_on     = [aws_subnet.private-subnet-a, aws_route_table.private-route-table-a]

}

resource "aws_route_table_association" "private-route-table-association-b" {
  subnet_id      = aws_subnet.private-subnet-b.id
  route_table_id = aws_route_table.private-route-table-b.id
  depends_on     = [aws_subnet.private-subnet-b, aws_route_table.private-route-table-b]
}

resource "aws_route_table_association" "db-route-table-association-a" {
  subnet_id      = aws_subnet.private-db-subnet-a.id
  route_table_id = aws_route_table.db-route-table.id
  depends_on     = [aws_subnet.private-db-subnet-a, aws_route_table.db-route-table]

}

resource "aws_route_table_association" "db-route-table-association-b" {
  subnet_id      = aws_subnet.private-db-subnet-b.id
  route_table_id = aws_route_table.db-route-table.id
  depends_on     = [aws_subnet.private-db-subnet-b, aws_route_table.db-route-table]

}
