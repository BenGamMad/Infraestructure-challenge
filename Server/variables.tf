variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "develop-website"
}

variable "instance_type" {
  description = "Name of the instance type"
  type        = string
  default     = "t2.micro"
}

variable "num_ec2" {
  description = "Number of identical instances"
  type = number
  default = 1
}