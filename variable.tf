variable "vpc_cidr" {
  type        = string
  default     = "10.1.0.0/16"
  description = "cidr for the vpc"
}
variable "public_subnet" {
  type        = list(string)
  default     = ["10.1.0.0/24", "10.1.1.0/24"]
  description = "public subnets for vpc"
}
variable "private_subnet" {
  type        = list(string)
  default     = ["10.1.2.0/24", "10.1.3.0/24"]
  description = "private subnets for vpc"
}
variable "availability_zone" {
  type        = list(string)
  description = "Azs for subnets"
}

