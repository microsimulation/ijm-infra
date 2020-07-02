variable "elb_vpc_id" {
    type        = string
    description = "VPC Id"
    default     = "vpc-5ade9232"
}

variable "elb_subnet_tier" {
    type        = string
    description = "This is value of Tier tag of Subnet"
    default     = "Public"
}

variable "elb_sg_id" {
    type        = string
    description = "SG Id for ALB"
}

variable "elb_target_ec2_id" {
    type        = string
    description = "EC2 ID for attachment"
}