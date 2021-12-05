resource "aws_subnet" "public-subnet-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public-subnet-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-b"
  }
}

resource "aws_subnet" "private-subnet-a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "private-subnet-a"
  }
}

resource "aws_subnet" "private-subnet-b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "private-subnet-b"
  }
}

resource "aws_subnet" "private-db-subnet-a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "private-database-subnet-a"
  }
}

resource "aws_subnet" "private-db-subnet-b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "private-atabase-subnet-b"
  }
}
