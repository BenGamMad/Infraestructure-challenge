

#resource "aws_s3_bucket" "Terraform-Bucket" {
  #bucket = "Terraform-challenge-tf-state"
  #lifecycle {
    #prevent_destroy = true
  #}
  #versioning {
   #enabled = true 
  #}
#}

module "development" {
  source = "./Environments/Develop"
  
}

module "staging" {
  source = "./Environments/Staging"
}