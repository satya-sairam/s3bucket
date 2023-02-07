resource "aws_s3_bucket" "new_bucket" {
  bucket = "testings3bucket"

  tags = {
    Name        = "testing"

  }
}
provider "aws" {
  region = "ap-south-1"
}