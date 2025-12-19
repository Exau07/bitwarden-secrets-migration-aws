variable "subnet_id" {
  description = "Subnet ID (public)"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "iam_role_name" {
  description = "IAM Role for EC2"
  type        = string
}

variable "instance_type" {
  default = "t3.micro"
}