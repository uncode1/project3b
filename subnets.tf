resource "aws_subnet" "group9_public_subnet" {
vpc_id            = aws_vpc.group9_vpc.id
cidr_block        = var.public_subnet_cidr
map_public_ip_on_launch = true

depends_on = [aws_internet_gateway.group9_igw]

tags = {
   Name = "devops-group-9"
 }
}

resource "aws_subnet" "group9_private_subnet" {
vpc_id     = aws_vpc.group9_vpc.id
cidr_block = var.private_subnet_cidr
tags = {
   Name = "devops-group-9"
 }
}
