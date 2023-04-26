terraform {
    backend "s3" {
        bucket="terraform-challenge-tf-state"
        key=".terraform/terraform.tfstate"
        region="us-east-1"
    }
}