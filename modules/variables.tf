variable "environment" {
  default = "Terrraform-Va."
}

variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  description = "This is our VPC CIDR block"
}

variable "public_subnet_cidr_1" {
  default     = "10.0.2.0/24"
  description = "This is our public subnet CIDR block"
}

variable "public_subnet_cidr_2" {
  default     = "10.0.3.0/24"
  description = "This is our public subnet CIDR block"
}

variable "private_subnet_cidr_1" {
  default     = "10.0.4.0/24"
  description = "This is our private subnet CIDR block"
}

variable "private_subnet_cidr_2" {
  default     = "10.0.5.0/24"
  description = "This is our private subnet CIDR block"
}