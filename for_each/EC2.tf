
resource "aws_instance" "this"{
    for_each = var.instances # terraform will give a value called "each" keyword
    ami     = var.ami_id # this is our devops-practice amiID
    instance_type = each.value
    vpc_security_group_ids  = [aws_security_group.allow_tls.id]
    tags = {
      Name = each.key
}
}

resource "aws_security_group" "allow_tls" {
  name              = "allow_tls"
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

# output "ec2_info"{
#   value =  aws_instance.this
# }