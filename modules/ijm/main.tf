data "template_file" "ijm_ec2_init_script" {
    template    = "${file("modules/ijm/templates/ijm_init_script.tpl")}"
}

resource "aws_instance" "ijm_test_instance" {
    ami                 = var.ec2_ami
    availability_zone   = var.ec2_availability_zone
    instance_type       = var.ec2_type
    key_name            = var.ec2_key
    security_groups     = [var.ec2_sg_web, var.ec2_sg_ssh]
    associate_public_ip_address = true
    subnet_id           = var.ec2_subnet_id
    user_data           = data.template_file.ijm_ec2_init_script.rendered

    root_block_device {
        volume_type             = "gp2"
        volume_size             = "15"
        delete_on_termination   = true
    }

    tags = {
        Name        = "ELF-IJM-Test"
    }
}


resource "aws_eip" "ijm_ec2_static_ip" {
    instance    = aws_instance.ijm_test_instance.id
    vpc         = true
        
    tags        = {
        Name        = "ELF-IJM-Test"
    }
}