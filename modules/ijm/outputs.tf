output "out_ec2_public_ip" {
    value = aws_instance.ijm_test_instance.public_ip
}

output "out_ec2_public_dns" {
    value = aws_instance.ijm_test_instance.public_dns
}

output "out_ec2_id" {
    value = aws_instance.ijm_test_instance.id
}

output "out_eip_public_ip" {
    value = aws_eip.ijm_ec2_static_ip.public_ip
}

output "out_eip_public_dns" {
    value = aws_eip.ijm_ec2_static_ip.public_dns
}