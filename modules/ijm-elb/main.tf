data "aws_subnet_ids" "elb_subnets" {
    vpc_id = var.elb_vpc_id

    tags = {
        Tier    = var.elb_subnet_tier
    }
}

resource "aws_lb" "elf_ijm_alb" {
    name                = "ELF-IJM-ALB"
    internal            = false
    load_balancer_type  = "application"
    security_groups     = [var.elb_sg_id]
    subnets             = data.aws_subnet_ids.elb_subnets.ids

    tags = {
        Name        = "ELF-IJM-ALB"
        Environment = "DEV"
    }
}

resource "aws_lb_target_group" "elf_ijm_ec2_tg" {
    name        = "ELF-IJM-EC2-TG"
    port        = 80
    protocol    = "HTTP"
    vpc_id      = var.elb_vpc_id
    target_type = "instance"
}

resource "aws_lb_target_group_attachment" "elf_ijm_ec2_tg_attach" {
    target_group_arn = aws_lb_target_group.elf_ijm_ec2_tg.arn
    target_id        = var.elb_target_ec2_id
    port             = "80"
}

resource "aws_lb_listener" "elf_ijm_ls" {
    load_balancer_arn = aws_lb.elf_ijm_alb.arn
    port              = "80"
    protocol          = "HTTP"

    default_action {
        type                = "redirect"
        redirect {
            port            = 443
            protocol        = "HTTPS"
            status_code     = "HTTP_301"
        }
    }
}
