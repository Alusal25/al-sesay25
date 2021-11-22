variable "ami" {
  type        = string
  default     = ""
  description = "Id of the ami for ec2"
}
variable "instance_type" {
  type        = string
  default     = ""
  description = "Type of the instance"
}
variable "volume_size" {
  type        = number
  default     = 20
  description = "Size of the ec2 instance"
}
variable "subnet_id" {
  type        = string
  default     = ""
  description = "Subnets for which ec2 instance will be deployed"
}
variable "vpc_id" {
  type        = string
  default     = ""
  description = "vpc id needed for security of ec2 instance"
}
variable "key_name" {
  type        = string
  default     = ""
  description = "Key pair for the ec2 instance"
}
