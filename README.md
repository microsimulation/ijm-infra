# IJM deployment - Development environment

## Prerequrements
Please check next items before starting deployment:
1. You have correct credentials set up
1. You have installed `Terraform v0.12`
1. You have a registered domain, hosted zone and alias
    * This is not mandatory. please skip step 12 from deployment procedure in case you don\`t have them
1. You have access to code or docker images
1. You have VPC and subnets set up on your AWS account
    * Please note Terraform loads information about subnets based on it\`s name.
1. You have AWS EC2 Key pair 
1. Please note that default Availability zone was set to `us-east-1` 
    * Don\`t forget to update it and AMI ID 
1. Please do check and update variables in `variables.tf` and `modeles/ijm/variables.tf` 
    * Please don\`t forget to update `allowed_input_cidr` as this controls application access by IP addresses

## Deployment steps
1. From root module - run `terraform init`
1. From root module - run `terraform plan -target=module.ijm_sg`
1. From root module - run `terraform apply -target=module.ijm_sg`
1. From root module - run `terraform plan -target=module.ijm`
1. From root module - run `terraform apply -target=module.ijm` 
1. From root module - run `terraform plan -target=module.ijm_elb`
1. From root module - run `terraform apply -target=module.ijm_elb`
1. Connect to the EC2 instanse from step 3 with SSH key
1. Get code with git/zip or pull images from docker registry
1. Run `docker-compose up -d`
1. Run `docker ps` in order to check containers are up
1. From AWS Console - Go to `Route 53` -> `Hosted Zones` and assign A-type record with ELB form step 5

## Checks
1. Check application access in your web browser:
    * If you skipped step 12, please use the ALB DNS record
    * If you executed step 12, please use created A record and port 80