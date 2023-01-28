output "main_vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.main.id
}

output "private_subnet01_id" {
  description = "This is the ID of the private subnet in the availability zone1"
  value = aws_subnet.private-subnet01.id
}

output "private_subnet02_id" {
  description = "The ID of the private subnet in the availability zone 2"
  value = aws_subnet.private-subnet02
}

output "public_subnet01_id" {
  description = "The ID of the public subnet in the availability zone 1"
  value = aws_subnet.public-subnet01.id
}

output "public_subnet02_id" {
  description = "The ID of the public subnet in the availability zone 2"
  value = aws_subnet.public-subnet02
}