resource "aws_vpc" "vpc" {
     cidr_block = "10.0.0.0/16"
    tags ={
        Name=var.vpc_name
    }
  
}

resource "aws_subnet" "subnet" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = var.subnet_name
    }
}