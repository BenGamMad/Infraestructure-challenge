module "staging-network" {
    source = "../../Network"
    vpc_name = "VPC-Staging"
    subnet_name = "Subnet-Staging"
}

module "staging-server" {
    source = "../../Server"
    count = 2
    instance_name = "Staging-Website"
    instance_type = "t2.micro"
}