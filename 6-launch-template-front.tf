resource "aws_launch_template" "front" {
  name                                 = "frontend"
  instance_type                        = "t2.micro"
  image_id                             = "ami-05d34d340fb1d89e5"
  key_name                             = "frankfurt_linuxt2"
  instance_initiated_shutdown_behavior = "terminate"
  update_default_version               = true

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ssh.id, aws_security_group.ssh.id]
  }

  placement {
    availability_zone = "eu-central-1a"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "frontend"
    }
  }

  user_data = filebase64("files/front_user_data.sh")
}
