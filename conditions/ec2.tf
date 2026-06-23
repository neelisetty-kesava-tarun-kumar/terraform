#This is depencecy manager for aws.
resource "aws_instance" "example" {
  ami           = var.ami_id #The key words(like:- ami) cannot be changed but the values(like:- "ami-0220d79f3f480ecf5") can be changed according to the user reuirements.
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small" //Writing the condition in terraform in terinanry operation.
  vpc_security_group_ids = [aws_security_group.allow_tls.id] #[aws_security_group.allow_tls.id] -> this is the dependency for security group. It will create security group first and then create instance.

  tags = var.ec2_tags #The key words(like:- tags) cannot be changed but the values(like:- var.ec2_tags) can be changed according to the user reuirements. var.ec2_tags will send the data to tags block from variables.
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.sg_description
  
  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}