variable "ijm_alarm_email" {
    type        = string
    description = "Email address where alarm will be sent to"
    default     = ""
}

variable "alb_tg_arn_suf" {
    type        = string
    description = "Target Group ARN suffix"
}

variable "alb_arn_suf" {
    type        = string
    description = "ALB ARN suffix"
}