variable "ami" {
  type        = string
  description = "ami for ec2"
}

variable "ec2_type" {
  type        = string
  description = "instance type"
}

variable "subnet_id" {
  type        = string
  description = "id for basion host subnet"
}

variable "key_name" {
  type        = string
  description = "name of key"
}

variable "ec2_name" {
  type        = string
  description = "name of ec2"
}

variable "enable_publicIP" {
  type        = bool
  description = "true"
}

variable "security_group" {
  type        = string
  description = "security group name"
}

variable "vpc_id" {
  type        = string
  description = "id for vpc"
}

variable "public_cidr" {
  type        = string
  description = "0.0.0.0/0"
}