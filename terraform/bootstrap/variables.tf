variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "interview-ecs"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "terraform_role" {
  description = "Terraform IAM role name"
  type        = string
}
