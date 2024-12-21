# ECS Infrastructure Project

This project contains Terraform configurations to deploy a secure, highly available, and scalable infrastructure for a web application using AWS ECS and related services.

## Architecture Overview

The infrastructure includes:
- ECS Cluster with Fargate
- Application Load Balancer
- VPC with public and private subnets
- NAT Gateway
- CloudWatch Logs
- S3 for Terraform state
- DynamoDB for state locking

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.5.7
- Docker (for local testing)

## Getting Started

1. Configure AWS credentials
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Review the plan:
   ```bash
   terraform plan
   ```
4. Apply the configuration:
   ```bash
   terraform apply
   ```

## Configuration

1. Create `terraform.tfvars` files:
   ```bash
   # In terraform/bootstrap directory
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your AWS account ID and role name

   # In terraform directory
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your values
   ```

2. Update backend configuration:
   After running bootstrap, update the values in `terraform/backend.tf` with your actual S3 bucket and DynamoDB table names.

## Testing

The infrastructure deploys the `crccheck/hello-world` container. You can test it locally using:
```bash
docker run -d --rm --name web-test -p 80:8000 crccheck/hello-world
curl -I localhost
```
