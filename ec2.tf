 resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop-all.id]
  tags = {
    Name = "helloworld"
  }
 }
 
 
 resource "aws_security_group" "roboshop-all" {
  name        = "roboshop-all-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.main.id
   ingress {
        description      = "Allow All ports"
        from_port        = 0 # 0 means all ports
        to_port          = 0 
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"]
    }

  tags = {
    Name = "allow_roboshop-sg"
  }
}
 

 