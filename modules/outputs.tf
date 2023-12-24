output "vpc_id" {
  value = aws_vpc.vpc_test.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc_test.cidr_block
}

output "public_subnet_cidr-1" {
  value = aws_subnet.vpc_test-subnet-public_1.cidr_block
}

output "public_subnet_cidr-2" {
  value = aws_subnet.vpc_test-subnet-public_2.cidr_block
}

output "private_subnet_cidr-1" {
  value = aws_subnet.vpc_test-subnet-private_1.cidr_block
}

output "private_subnet_cidr-2" {
  value = aws_subnet.vpc_test-subnet-private_2.cidr_block
}