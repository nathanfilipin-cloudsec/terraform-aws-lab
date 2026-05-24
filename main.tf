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

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "SUBNET1"
  }

}


resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "SUBNET2"
  }

}


resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "SUBNET3"
  }

}
