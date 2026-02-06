data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-kernel-6.1-x86_64"]
  }
}

resource "aws_security_group" "macro_sg" {
  name        = "${var.project_name}-${var.environment}-sg"
  description = "Security group for IP Block Macro (Node.js)"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-sg"
  }
}

resource "aws_s3_bucket" "macro_logs" {
  bucket = var.bucket_name

  tags = {
    Name        = "${var.project_name}-logs"
    Environment = var.environment
  }
}

resource "aws_instance" "macro_worker" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.macro_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nodejs
              npm install -g pm2
              EOF

  tags = {
    Name        = "${var.project_name}-${var.environment}-worker"
    Role        = "request-sender"
    ManagedBy   = "terraform"
  }
}