
resource "aws_instance" "This"{
    ami     = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids  = [aws_security_group.allow_tls.id]
    tags = {
      Name = "expense-demo"
    }
  provisioner "local-exec" {
    command = "echo Hellow World"
  }

   connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
}

resource "aws_security_group" "allow_tls" {
  name              = "allow_tls09"
  description       = "allow tls inbound trafic and all outbound traffic"

 ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
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