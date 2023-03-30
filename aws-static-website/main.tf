terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48"
    }
  }

  required_version = ">= 1.3.6"
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["./credentials"]
  profile                  = "terraform"
}
