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

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "container_image" {
  description = "Docker image to run in the ECS cluster"
  type        = string
  default     = "crccheck/hello-world:latest"
}

variable "container_port" {
  description = "Port exposed by the docker image"
  type        = number
  default     = 8000
}

variable "task_cpu" {
  description = "The number of cpu units used by the task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "The amount (in MiB) of memory used by the task"
  type        = number
  default     = 512
}

variable "service_desired_count" {
  description = "Number of tasks to run in the service"
  type        = number
  default     = 2
}

variable "logs_bucket_name" {
  description = "S3 bucket name for ALB access logs"
  type        = string
  default     = "alb-logs-interview-ecs-ucjcduvm"
}

variable "alarm_actions" {
  description = "List of ARNs to notify when alarm transitions to ALARM state"
  type        = list(string)
  default     = []
}

variable "ok_actions" {
  description = "List of ARNs to notify when alarm transitions to OK state"
  type        = list(string)
  default     = []
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "terraform_role" {
  description = "Terraform IAM role name"
  type        = string
}

variable "state_bucket" {
  description = "S3 bucket for Terraform state"
  type        = string
}

variable "dynamodb_table" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}
