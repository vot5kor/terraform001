
variable "instances"{
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}
variable zone_id{
    default = "Z07729851ZGLEFQP62W7R"
}

variable "domain_name"{
    default = "tuktukride.online"
}

variable "ami_id"{
    default = "ami-09c813fb71547fc4f"
}