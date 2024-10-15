resource "aws_vpc" "group9_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
   Name = "devops-group-9"
 }
}

resource "aws_internet_gateway" "group9_igw" {
  vpc_id = aws_vpc.group9_vpc.id
  tags = {
   Name = "devops-group-9"
 }
}
