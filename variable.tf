variable "vpc_cidr" {
  description = "VPC CIDR value"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR value"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR value"
  default = "10.0.2.0/24"
}

variable "nat_gw" {
  description = "NAT Gateway"
  default     = "true"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-0e86e20dae9224db8" # Ubuntu AMI
}