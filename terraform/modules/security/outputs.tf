output "iam_role_name" {
  description = "IAM Role name for EC2"
  value       = aws_iam_role.bitwarden_ec2_role.name
}

output "security_group_id" {
  description = "Security group for Bitwarden EC2"
  value       = aws_security_group.bitwarden_sg.id
}