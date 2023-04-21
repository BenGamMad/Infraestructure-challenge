variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "staging-website"
}

variable "vpc_name" {
  description = "Name tag for vpc network"
  type        = string
  default     = "vpc-staging"
}

variable "subnet_name" {
  description = "Name tag for subnet network"
  type        = string
  default     = "subnet-staging"
}