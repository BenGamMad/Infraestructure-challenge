

resource "aws_s3_bucket" "Terraform-Bucket" {
  bucket = "terraform-challenge-tf-state"
  lifecycle {
    prevent_destroy = true
  }
  versioning {
   enabled = true 
  }
}

module "production" {
  source = "./Environments/Production"
  
}