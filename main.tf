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

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name= "main_igw"
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

resource "aws_route_table" "route_table" {
vpc_id = aws_vpc.main-vpc.id

route {
  cidr_block= "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main_igw.id
}
tags = {
  Name= "route_table"
}
}

resource "aws_route_table_association" "main" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table.id
  
}