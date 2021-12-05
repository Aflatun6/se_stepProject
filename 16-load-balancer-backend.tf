resource "aws_lb" "backend-lb" {
  name               = "backend-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ssh.id]
  subnets            = [aws_subnet.private-subnet-a.id, aws_subnet.private-subnet-b.id]
}
resource "aws_lb_target_group" "backend-tg" {
  vpc_id   = aws_vpc.vpc.id
  name     = "backned-target-group"
  port     = 80
  protocol = "HTTP"
}
