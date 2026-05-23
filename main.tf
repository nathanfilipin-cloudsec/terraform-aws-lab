resource "aws_s3_bucket" "teste" {
  bucket = "nathan-cloudsec-839221"

  tags = {
    Name = "TerraformLab"
  }
}
resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"

   tags = {
    Name = "VPC"
  }
}

resource "aws_subnet" "main-subnet" {
    vpc_id = aws_vpc.main-vpc
    cidr_block = "10.0.0.0/16"

    tags = {
    Name = "SUBNET"
  } 
  
}
