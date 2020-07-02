resource "aws_security_group" "ijm_alb_sg" {
    name        = "IJM-ALB-SG"
    description = "Test Security group for IJM deployment"
    vpc_id      = var.vpc_id
}

resource "aws_security_group" "ijm_web_sg" {
    name        = "IJM-WEB-SG"
    description = "Test Security group for IJM deployment"
    vpc_id      = var.vpc_id
}

resource "aws_security_group" "ijm_ec2_access_sg" {
    name        = "IJM-EC2-ACCESS-SG"
    description = "Test Security group for IJM deployment"
    vpc_id      = var.vpc_id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.allowed_input_cidr]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [var.allowed_all_cidr]
    }
}

resource "aws_security_group_rule" "ijm_alb_inbound_1" {
    security_group_id  = aws_security_group.ijm_alb_sg.id
    type               = "ingress"
    cidr_blocks        = [var.allowed_all_cidr]
    from_port          = "80"
    to_port            = "80"
    protocol           = "tcp"
}

resource "aws_security_group_rule" "ijm_alb_outbound_1" {
    depends_on                  = [aws_security_group.ijm_alb_sg]

    security_group_id           = aws_security_group.ijm_alb_sg.id
    type                        = "egress"
    source_security_group_id    = aws_security_group.ijm_web_sg.id
    from_port                   = "80"
    to_port                     = "80"
    protocol                    = "tcp"
} 

resource "aws_security_group_rule" "ijm_web_inbound_1" {
    depends_on                  = [aws_security_group.ijm_web_sg]

    security_group_id           = aws_security_group.ijm_web_sg.id
    type                        = "ingress"
    source_security_group_id    = aws_security_group.ijm_alb_sg.id
    from_port                   = "80"
    to_port                     = "80"
    protocol                    = "tcp"
}

resource "aws_security_group_rule" "ijm_web_outbound_1" {
    security_group_id           = aws_security_group.ijm_web_sg.id
    type                        = "egress"
    cidr_blocks                 = [var.allowed_all_cidr]
    from_port                   = "0"
    to_port                     = "0"
    protocol                    = "-1"
}