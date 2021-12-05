resource "aws_autoscaling_group" "autoscaling-group-frontend" {
  name = "autoscaling-group-frontend"

  vpc_zone_identifier = [aws_subnet.public-subnet-a.id, aws_subnet.public-subnet-b.id]
  desired_capacity    = 2
  max_size            = 10
  min_size            = 2

  target_group_arns = [
    aws_lb_target_group.front-tg.arn
  ]

  health_check_grace_period = 60

  protect_from_scale_in = false

  launch_template {
    id      = aws_launch_template.front.id
    version = "$Latest"
  }

  tag {
    key                 = "scaling-group"
    propagate_at_launch = true
    value               = "autoscaling-frontend"
  }
}

resource "aws_autoscaling_policy" "scale-policy-front" {
  name        = "requests_count_scaling_policy"
  policy_type = "TargetTrackingScaling"

  autoscaling_group_name = aws_autoscaling_group.autoscaling-group-frontend.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = format("%s/%s", aws_lb.front-lb.arn, aws_lb_target_group.front-tg.arn_suffix)
    }

    target_value = 30
  }
}
