resource "aws_s3_bucket" "new_bucket" {
  count = length(var.s3_bucketnames)
  bucket = element(var.s3_bucketnames, count.index )

  tags = {
    Name        = "testing"

  }
}
provider "aws" {
  region = "us-east-1"
}





#
#resource "aws_instance" "web" {
#  ami           = "ami-01a4f99c4ac11b03c"
#  instance_type = "t2.micro"
#
#  tags = {
#    Name = "namechange"
#  }
#}