variable "subnet_id" {
  type        = list(string)
  default     = [""]
  description = "subnet id for loadbalancer"
}
variable "tags" {
  type        = map(string)
  description = "tags for loadbalancer"
}
variable "lb_port" {
  type        = string
  default     = "80"
  description = "port for loadbalancer"
}

variable "lb_protocol" {
  type        = string
  default     = "HTTP"
  description = "protocol for loadbalancer"
}
variable "vpc_id" {
  type        = string
  default     = ""
  description = "vpc id for security group"
}
variable "healthy_threshold" {
  type        = number
  default     = 3
  description = "number of healthy threshold"
}
variable "unhealthy_threshold" {
  type        = number
  default     = 3
  description = "number of unhealthy threshold"
}
variable "timeout" {
  type        = number
  default     = 3
  description = "timeout for healthcheck"
}
variable "interval" {
  type        = number
  default     = 30
  description = "interval for health check"
}

variable "sec_group_ingress_from_port" {
  type        = number
  default     = "80"
  description = "port for security group"
}
variable "sec_group_ingress_to_port" {
  type        = string
  default     = "80"
  description = "port for security group"
}
variable "asg" {
  type        = string
  default     = ""
  description = "id of autoscaling"
}
