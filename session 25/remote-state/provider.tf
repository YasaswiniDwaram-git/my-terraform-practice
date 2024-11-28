terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.77.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "aws-remote-locking"
    key    = "remote-state-demo"
    region = "us-east-1"
    dynamodb_table = "remote_state_locking"
  }
}

provider "aws" {
    region = "us-east-1"
}
