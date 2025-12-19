resource "aws_security_group" "bitwarden_sg" {
  name        = "bitwarden-sg"
  description = "Security group for Bitwarden"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_https_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bitwarden-sg"
  }
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "bitwarden_ec2_role" {
  name               = "bitwarden-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_policy" "bitwarden_policy" {
  name        = "bitwarden-policy"
  description = "Least privilege policy for Bitwarden EC2"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "bitwarden_attach" {
  role       = aws_iam_role.bitwarden_ec2_role.name
  policy_arn = aws_iam_policy.bitwarden_policy.arn
}