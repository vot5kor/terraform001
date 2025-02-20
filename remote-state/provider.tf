terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "dev82s-kvnarayan"
    key    = "expense-backend-dev"
    region = "us-east-1"
    dynamodb_table = "dev82s-dynamodb"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}