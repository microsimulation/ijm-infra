output "ijm_ec2_ips" {
    value = module.ijm.out_ec2_public_ip
}

output "ijm_ec2_dns" {
    value = module.ijm.out_ec2_public_dns
}

output "ijm_sg_alb" {
    value = module.ijm_sg.out_alb_sg_id
}

output "ijm_sg_web" {
    value = module.ijm_sg.out_web_sg_id
}

output "ijm_sg_ec2" {
    value = module.ijm_sg.out_ec2_sg_id
}

output "ijm_ec2_id" {
    value = module.ijm.out_ec2_id
}

output "ijm_eip_public_ip" {
    value = module.ijm.out_eip_public_ip
}

output "ijm_eip_public_dns" {
    value = module.ijm.out_eip_public_dns
}

output "ijm_alb_dns" {
    value = module.ijm_elb.out_alb_dns
}

output "ijm_ecr_api_url" {
    value = module.ijm_ecr.out_ecr_api_repo_url
}

output "ijm_ecr_journal_url" {
    value = module.ijm_ecr.out_ecr_journal_repo_url
}

output "ijm_ecr_web_url" {
    value = module.ijm_ecr.out_ecr_web_repo_url
}

output "ijm_ecr_reg_id" {
    value = module.ijm_ecr.out_ecr_registry_id
}