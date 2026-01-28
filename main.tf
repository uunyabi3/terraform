resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = var.vpc_name
        Environment = "Dev"
        Project = "Road-to-SRE"
    }
}

resource "aws_subnet" "public_1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "${var.vpc_name}-public-1a"
    }
}