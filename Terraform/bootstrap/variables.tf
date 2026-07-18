variable "region" {
  type        = string
  description = "AWS region to deploy into" 
}

variable "account_id" {
  type        = string
  description = "AWS account ID"
}

variable "domain" {
  type        = string
  description = "Domain"
}

variable "github_repo" {
  type        = string
  description = "GitHub Repository"
}