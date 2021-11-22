variable "lt_name" {
  type        = string
  default     = "launch_template"
  description = "Name of the launch template"
}
variable "image_id" {
  type        = string
  default     = ""
  description = "ami id for launch template"
}
variable "instance_type" {
  type        = string
  default     = ""
  description = "Typr of the ec2 instance"
}
variable "asg_name" {
  type        = string
  default     = ""
  description = "name of the autoscaling group"
}
variable "desired_capacity" {
  type        = number
  default     = 1
  description = "Desired capacity for asg"
}
variable "max_size" {
  type        = number
  default     = 6
  description = "Max capacity for asg"
}
variable "min_size" {
  type        = number
  default     = 2
  description = "Min capacity for asg"
}

variable "subnet_id" {
  default     = ""
  description = "vpc subnets on which asg will deploy"
}
variable "vpc_id" {
  type        = string
  default     = ""
  description = "vpc id for asg security groups"
}
variable "key_name" {
  type        = string
  default     = ""
  description = "key_name of the ec2 instance"
}
variable target_group {
  type        = string
  default     = ""
  description = "target group arn list"
}

