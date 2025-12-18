variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "CIDR des subnets publics"
  type        = list(string)
}

variable "private_subnets_cidr" {
  description = "CIDR des subnets privés"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
}