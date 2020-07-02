terraform {
    backend "s3" {
        bucket  = "ijm-elife-devops-bucket"
        key     = "ijm-demo/terraform.tfstate"
        region  = "eu-west-2"
    }

    required_providers {
        aws     = "2.46.0"
    }
}

provider "aws" {
    version                 = "~> 2.46.0"
    region                  = "eu-west-2"
    shared_credentials_file = ""
    profile                 = "ijm"
}


module "ijm_sg" {
    source  = "./modules/ijm-sg"
}

module "ijm" {
    source      = "./modules/ijm"

    ec2_sg_web  = module.ijm_sg.out_web_sg_id
    ec2_sg_ssh  = module.ijm_sg.out_ec2_sg_id
}

module "ijm_elb" {
    source      = "./modules/ijm-elb"

    elb_sg_id           = module.ijm_sg.out_alb_sg_id
    elb_target_ec2_id   = module.ijm.out_ec2_id
}

module "ijm_cw" {
    source      = "./modules/ijm-cloudwatch"
}