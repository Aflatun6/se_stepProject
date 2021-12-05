resource "aws_security_group" "http" {
  name   = "Allow web"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "http"
  }
}

resource "aws_security_group" "ssh" {
  name   = "Allow ssh"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "db-security-group" {
  vpc_id = aws_vpc.vpc.id
  name   = "database-security-group"

  ingress {
    from_port   = 3306
    protocol    = "TCP"
    to_port     = 3306
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 3306
    protocol    = "TCP"
    to_port     = 3306
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = {
    Name = "database-security-group"
  }
}
