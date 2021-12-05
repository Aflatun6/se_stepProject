resource "aws_launch_template" "backend" {
  name                                 = "backend"
  instance_type                        = "t2.micro"
  image_id                             = "ami-05d34d340fb1d89e5"
  key_name                             = "frankfurt_linuxt2"
  instance_initiated_shutdown_behavior = "terminate"
  update_default_version               = true

  placement {
    availability_zone = "eu-central-1a"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "backend"
    }
  }

  user_data = filebase64("files/backend_user_data.sh")
}