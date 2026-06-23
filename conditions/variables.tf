variable "environment" {
    default = "dev" //In the place dev any other calue like prod is there then the t3.small will be created.
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  description = "RHEL 9 Image"
}

variable "instance_type"{
    type = string
    default = "t3.micro"
}

variable "ec2_tags"{
    type = map
    default = {
        Name = "Variables-demo"
        Project = "Roboshop"
        Terraform = "True"
        Environment = "dev"
    }
}

variable "sg_name"{
    default = "allow-all-terraform"
    type = string
}

variable "sg_description"{
    default = "Allow TLS inbound traffic and all outbound traffic"
    type = string #Optional
}

variable "sg_from_port"{
    type = number
    default = 0
}

variable "sg_to_port"{
    type = number
    default = 0
}

variable "cidr_blocks"{
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_tags"{
    type = map
    default = {
        Name = "allow-all-terraform"
        Project = "Roboshop"
        Terraform = "True"
        Environment = "dev"
    }
}