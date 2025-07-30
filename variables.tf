variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name tag of the existing VPC to use"
  type        = string
  default     = "Aplication-Vpc"
}