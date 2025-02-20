locals {
    ami_id = data.aws_ami.mine.id
    instance = "t3.micro"
    name = "${var.project}-${var.component}-${var.environment}"

}