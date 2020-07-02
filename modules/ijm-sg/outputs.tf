output "out_alb_sg_id" {
    value = aws_security_group.ijm_alb_sg.id
}

output "out_web_sg_id" {
    value = aws_security_group.ijm_web_sg.id
}

output "out_ec2_sg_id" {
    value = aws_security_group.ijm_ec2_access_sg.id
}