output "alb" {
  value = aws_lb.alb
}
output "alb_sg" {
  value = aws_security_group.alb_sec_group
}
output tg {
  value       = aws_lb_target_group.tg
}
