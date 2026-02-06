variable "aws_region" {
  default = "ap-northeast-2"
}

variable "project_name" {
  description = "Project Name"
  default     = "ipblock-macro"
}

variable "environment" {
  description = "Environment"
  default     = "prod"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "bucket_name" {
  description = "Log Storage for IP Block Macro"
  default     = "ipblock-macro-prod-logs-2026"
}