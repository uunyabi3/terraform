output "worker_ip" {
  description = "ipblock-macro worker public IP"
  value       = aws_instance.macro_worker.public_ip
}

output "s3_bucket" {
  description = "Log storage bucket name"
  value       = aws_s3_bucket.macro_logs.id
}