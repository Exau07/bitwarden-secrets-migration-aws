resource "aws_iam_instance_profile" "this" {
  name = "bitwarden-instance-profile"
  role = var.iam_role_name
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "bitwarden" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = aws_iam_instance_profile.this.name

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "bitwarden-ec2"
  }
}