module "develop-network" {
    source = "../../Network"
    vpc_name = "VPC-Develop"
    subnet_name = "Subnet-Develop"
}

module "develop-server" {
    source = "../../Server"
    count = 1
    instance_name = "Develop-Website"
    instance_type = "t2.micro"
}