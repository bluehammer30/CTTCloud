output "terraform_state_bucket" {
  description = "Name of the S3 bucket used for Terraform state storage"
  value       = aws_s3_bucket.terraform_state.id
}

output "terraform_state_dynamodb_table" {
  description = "Name of the DynamoDB table used for Terraform state locking"
  value       = aws_dynamodb_table.terraform_locks.id
}

output "alb_logs_bucket" {
  description = "Name of the S3 bucket used for ALB logs"
  value       = aws_s3_bucket.alb_logs.id
}
