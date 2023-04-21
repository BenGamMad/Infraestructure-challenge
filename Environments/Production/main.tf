module "prod-network" {
    source = "../../Network"
    vpc_name = "VPC-Production"
    subnet_name = "Subnet-Production"
}

module "prod-server" {
    source = "../../Server"
    count = 4
    instance_name = "Production-Website"
    instance_type = "t2.micro"
}