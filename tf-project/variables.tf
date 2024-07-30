variable "aws_region" {
#   description = "The AWS region to create resources in."
  type        = string
  default     = ""
}

variable "aws_access_key_id" {
#   description = "The AWS access key ID."
#   type        = string
  default     = ""
}

variable "aws_secret_access_key" {
#   description = "The AWS secret access key."
#   type        = string
#   sensitive   = true
  default     = ""
}

# variable "application_name" {
#   description = "The name of the application."
#   type        = string
#   default     = ""
# }

variable "aws_profile" {
  type        = string
  description = "The AWS profile to use to execute the commands"
  default     = "default"
}

variable "environment" {
  type        = string
  description = "The environment to deploy to"
  default     = "dev"
}

variable "instance_type" {
  type        = string
  description = "The instance power"
}
