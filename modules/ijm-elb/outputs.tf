output "out_alb_dns" {
    value = aws_lb.elf_ijm_alb.dns_name
}

output "out_alb_suffix" {
    value = aws_lb.elf_ijm_alb.arn_suffix
}

output "out_alb_tg_suffix" {
    value = aws_lb_target_group.elf_ijm_ec2_tg.arn_suffix
}