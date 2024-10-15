resource "aws_route_table" "group9_local_rt_tb" {
 vpc_id = aws_vpc.group9_vpc.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.group9_igw.id
 }
 
 tags = {
   Name = "devops-group-9"
 }
}

resource "aws_route_table" "group9_public_rt_tb" {
  vpc_id = aws_vpc.group9_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.group9_igw.id
  }

  tags = {
    Name = "devops-group-9"
  }
}

resource "aws_route_table_association" "group9_public_association" {
  subnet_id      = aws_subnet.group9_public_subnet.id
  route_table_id = aws_route_table.group9_public_rt_tb.id
}


resource "aws_route_table_association" "group9_private_association" {
  subnet_id      = aws_subnet.group9_private_subnet.id
  route_table_id = aws_route_table.group9_local_rt_tb.id
}
