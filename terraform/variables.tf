variable "access_key" {}

variable "secret_key" {}

variable "env" {
  description = "The environment name (staging, production)"
}

variable "region" {
  description = "The AWS region for the infrastructure to be created in"
  default = "us-east-1"
}

variable "bucket" {
  description = "The S3 bucket to place the Lambda code into"
}

variable "account" {
  description = "Your AWS Account number"
}