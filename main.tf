resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sec_group.id]
  subnets            = var.subnet_id
  tags               = var.tags
}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.lb_port
  protocol          = var.lb_protocol
  tags              = var.tags


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
resource "aws_lb_target_group" "tg" {
  name     = "targetgroup"
  port     = var.lb_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.interval
  }

}
resource "aws_security_group" "alb_sec_group" {
  name        = "alb_sec_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress {
    description = "TLS from VPC"
    from_port   = var.sec_group_ingress_from_port
    to_port     = var.sec_group_ingress_to_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = var.asg
  alb_target_group_arn   = aws_lb_target_group.tg.arn
}