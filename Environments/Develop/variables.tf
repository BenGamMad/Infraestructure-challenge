variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "develop-website"
}

variable "vpc_name" {
  description = "Name tag for vpc network"
  type        = string
  default     = "vpc-develop"
}

variable "subnet_name" {
  description = "Name tag for subnet network"
  type        = string
  default     = "subnet-develop"
}