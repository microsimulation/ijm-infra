variable "vpc_id" {
    type        = string
    description = "VPC Id"
    default     = "vpc-5ade9232"
}

variable "allowed_input_cidr" {
    type        = string
    description = "Allowed CIDR block for SSH access to EC2 instance"
    default     = "0.0.0.0/0" /* PLEASE DON`T FORGET TO UPDATE DEFAULT VALUE */
}

variable "allowed_all_cidr" {
    type        = string
    description = "CIDR block for all"
    default     = "0.0.0.0/0"
}