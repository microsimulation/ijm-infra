variable "ec2_type" {
    type        = string
    default     = "t3.medium"
    description = "EC2 instance type"
}

variable "ec2_ami" {
    type        = string
    default     = "ami-0cf94b1c148cb4b81"
    description = "EC2 AMI id - Amazon Linux 2 with docker repos"
}

variable "ec2_vpc_id" {
    type        = string
    default     = "vpc-5ade9232"
    description = "Please enter VPC id for EC2"
}

variable "ec2_key" {
    type        = string
    default     = "key" /* PLEASE DON`T FORGET TO UPDATE DEFAULT VALUE */  
    description = "SSH Key to connect to EC2 instance"
}

variable "ec2_availability_zone" {
    type        = string
    description = "Availability zone for EC2 instance"
    default     = "eu-west-2a"
}

variable "ec2_subnet_id" {
    type        = string
    description = "Subent id EC2 will be placed"
    default     = "subnet-9b188ae1"
}

variable "ec2_sg_web" {
    type        = string
    description = "SG id for access application"
}

variable "ec2_sg_ssh" {
    type        = string
    description = "SG id for SSH access"
}