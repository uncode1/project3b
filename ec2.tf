resource "aws_instance" "group9_nginx" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.group9_public_subnet.id
  security_groups = [aws_security_group.group9_nginx_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "devops-group-9"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt upgrade -y
    sudo apt install nginx -y
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF
}
