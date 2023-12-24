terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
 
  region = "us-east-1"
}
 // create vpc

resource "aws_vpc" "vpc_test" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = true
    tags = {
    Name = "test-vpc-${var.environment}"
  }
}

// create subnets

// public subnets
resource "aws_subnet" "vpc_test-subnet-public_1" {
  vpc_id     = aws_vpc.vpc_test.id
  cidr_block = var.public_subnet_cidr_1

  tags = {
    Name = "test-vpc-subnet-public-${var.environment}"
  }
}

resource "aws_subnet" "vpc_test-subnet-public_2" {
  vpc_id     = aws_vpc.vpc_test.id
  cidr_block = var.public_subnet_cidr_2

  tags = {
    Name = "test-vpc-subnet-public-${var.environment}"
  }
}

// private subnets
resource "aws_subnet" "vpc_test-subnet-private_1" {
  vpc_id     = aws_vpc.vpc_test.id
  cidr_block = var.private_subnet_cidr_1

  tags = {
    Name = "test-vpc-subnet-private-${var.environment}"
  }
}

resource "aws_subnet" "vpc_test-subnet-private_2" {
  vpc_id     = aws_vpc.vpc_test.id
  cidr_block = var.private_subnet_cidr_2

  tags = {
    Name = "test-vpc-subnet-private-${var.environment}"
  }
}


// create internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_test.id

  tags = {
    Name = "internet-geteway"
  }
}

// create route table 

resource "aws_route_table" "vpc-route_table" {
  vpc_id = aws_vpc.vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route_table-public"
  }
}

// associate subnet with route table

resource "aws_route_table_association" "rt-public-1" {
  subnet_id      = aws_subnet.vpc_test-subnet-public_1.id
  route_table_id = aws_route_table.vpc-route_table.id
}
resource "aws_route_table_association" "rt-public-2" {
  subnet_id      = aws_subnet.vpc_test-subnet-public_2.id
  route_table_id = aws_route_table.vpc-route_table.id
}

// create security group

resource "aws_security_group" "vpc-sc-gr" {
  name        = "sc-gr"
  vpc_id      = aws_vpc.vpc_test.id

  ingress {
    description      = "SSH"
    from_port        = 20
    to_port          = 20
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]  
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
