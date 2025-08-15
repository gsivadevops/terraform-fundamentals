terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket = "tf-remote-state-84s"
    key    = "remote-state-demo"
    region = "us-east-1"    
    #dynamodb_table = "84s-remote-state" # This will  create the lock file with DynamoDB mechanisam and state file is stored in S3 bucket, 
                                         # but DynamoDB lock file is deprecated.
    
    #s3 bucket locking
    encrypt  = true
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
}