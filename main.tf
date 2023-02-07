#resource "aws_s3_bucket" "new_bucket" {
#  bucket = "testings3bucketinsingaporeregion12345678"
#
#  tags = {
#    Name        = "testing"
#
#  }
#}
#provider "aws" {
#  region = "ap-south-1"
#}



resource "aws_instance" "web" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"

  tags = {
    Name = "namechange"
  }
}