variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "allowed_https_cidr" {
  description = "CIDR autorisé pour HTTPS"
  type        = list(string)
}