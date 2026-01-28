variable "aws_region" {
    description = "The AWS region to deploy resources in"
    type        = string
    default = "ap-northeast-1"
}

variable "vpc_name" {
    description = "The name of the VPC"
    type        = string
    default     = "hajimari-terraform"
}