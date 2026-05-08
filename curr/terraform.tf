terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }
  backend "s3" {
    bucket = "my-app-bucket-4534654765876"
    key = "terraform.tfstate"
    region = "us-east-2"
    use_lockfile="true"
    dynamodb_table= "pk_production-test-my-app-table-d"
  }
}
