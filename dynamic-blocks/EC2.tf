
resource "aws_instance" "This"{
    ami     = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids  = [aws_security_group.allow_tls.id]
    tags = {
      Name = "expense-demo"
    }

}

resource "aws_security_group" "allow_tls" {
  name              = "allow_tls009"
  description       = "allow tls inbound trafic and all outbound traffic"

 dynamic "ingress" {# terraform will give you keyword with block name, you can iterate with "ingress."
  for_each = var.ingress_port
    content{
    from_port       = ingress.value["from_port"]
    to_port         = ingress.value["to_port"]
    protocol        = ingress.value["protocol"]
    cidr_blocks      = ingress.value["cidr_blocks"]
    }
 }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_tls"
  }
}