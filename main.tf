resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  root_block_device {
    volume_size = var.volume_size
  }
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.ec2_sec_group.id]
  tags = {
    Name = "StandAlone Ec2"
  }
}
resource "aws_security_group" "ec2_sec_group" {
  name        = "ec2_sec_group"
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