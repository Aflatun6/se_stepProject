resource "aws_lb" "front-lb" {
  name               = "front-loan-balancer"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.http.id]

  subnets = [
    aws_subnet.public-subnet-a.id, aws_subnet.public-subnet-b.id
  ]

  enable_deletion_protection = false

  tags = {
    Name        = "front-load-balanced"
    Environment = "project"
  }


}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.front-lb.arn
  port              = 80

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "empty response"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "front-lb-rule" {
  listener_arn = aws_lb_listener.http.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front-tg.arn
  }

  condition {
    host_header {
      values = ["phonebook.com"]
    }
  }
}

resource "aws_lb_target_group" "front-tg" {
  vpc_id   = aws_vpc.vpc.id
  name     = "front-target-group"
  port     = 80
  protocol = "HTTP"
}
