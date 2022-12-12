//@author: DevProblems(Sarang Kumar A Tak)

terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.19"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}