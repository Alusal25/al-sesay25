resource "aws_launch_template" "lt" {
  name          = var.lt_name
  image_id      = var.image_id
  instance_type = var.instance_type
  user_data     = filebase64("${path.module}/user-data.sh")
  network_interfaces {
    subnet_id       = var.subnet_id[1]
    security_groups = [aws_security_group.asg_sec_group.id]
  }
  block_device_mappings {
    device_name = "/dev/sdh"
    ebs {
      volume_size = 20
    }
  }
  key_name = var.key_name
}

resource "aws_autoscaling_group" "asg" {
  name             = var.asg_name
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size
  # vpc_zone_identifier = var.subnet_id
  target_group_arns   = [var.target_group]
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
}
resource "aws_security_group" "asg_sec_group" {
  name        = "asg_sec_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}