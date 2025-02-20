
resource "aws_instance" "This"{
    ami     = data.aws_ami.mine.id
    instance_type = "t3.micro"
    vpc_security_group_ids  = [aws_security_group.allow_tls.id]
    tags = {
      Name = "datasourcedemo"
    }

}

resource "aws_security_group" "allow_tls" {
  name              = "allow_tls01"
  description       = "allow tls inbound trafic and all outbound traffic"

 ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
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