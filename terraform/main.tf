provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/${var.terraform_role}"
  }
}

module "vpc" {
  source = "../modules/vpc"

  environment     = var.environment
  project         = var.project
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "security" {
  source = "../modules/security"

  environment    = var.environment
  project        = var.project
  vpc_id         = module.vpc.vpc_id
  container_port = var.container_port
}

module "alb" {
  source = "../modules/alb"

  environment       = var.environment
  project          = var.project
  vpc_id           = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  security_group_id = module.security.alb_security_group_id
  container_port    = var.container_port
  logs_bucket_name  = var.logs_bucket_name
  alarm_actions     = var.alarm_actions
  ok_actions        = var.ok_actions
}

module "ecs" {
  source = "../modules/ecs"

  environment                 = var.environment
  project                    = var.project
  aws_region                 = var.aws_region
  container_image            = var.container_image
  container_port             = var.container_port
  task_cpu                   = var.task_cpu
  task_memory               = var.task_memory
  service_desired_count      = var.service_desired_count
  ecs_task_execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  ecs_task_role_arn          = aws_iam_role.ecs_task_role.arn
  private_subnet_ids         = module.vpc.private_subnet_ids
  ecs_tasks_security_group_id = module.security.ecs_tasks_security_group_id
  alb_target_group_arn       = module.alb.target_group_arn
}
