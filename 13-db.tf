resource "aws_db_subnet_group" "db-subnet" {
  name       = "DB subnet group"
  subnet_ids = [aws_subnet.db-subnet-a.id, aws_subnet.db-subnet-b.id]
}

resource "aws_db_instance" "db" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "phonebook"
  username               = "admin"
  password               = "23528861"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = "db-subnet"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db-security-group.id, aws_security_group.ssh.id]
}
