# Disaster Recovery plan

## Situation 1 - Site is being shown as not secured
    1. Check Certificate expiration date and go to AWS Console
    2. Select Certificate Manager service
    3. Check a box with expired certificate
        * Please ensure the status of the certificate is expired and it`s eligible for the renewal
    4. Request new certificate in ACM for required domain
    5. Once certificate has been issued, create a CNAME record in Route 53 
        * You can create this record directly from ACM. Expand certificate section and go to Domain.
          Expand Domain section and press "Create record in Route 53" button
    6. Please ensure certificate has been validated before moving forward
    7. Go to EC2 services
    8. Select Load Balancer from left menu
    9. Select application load balancer and go to the Listeners tab
    10. Select renewed certificate in listeners
    11. Export certificate and create a JKS store with it
    12. Encode it in Base64 and update secret in ijm repository

## Situation 2 - Site is not responding, but no alarm was triggered
    1. Go to AWS Console
    2. Select EC2 service
    3. Select Security groups from left menu
    4. Check load balancer`s security group allows all incoming traffic on ports 80, 443 and 8081 [Value in CIDR block should be 0.0.0.0/0]
    5. Go to VPC service 
    6. Select ACL from left menu
    7. Check that all incoming traffic is allowed
    8. Go to Route 53 service
    9. Check hosted zone and ensure LB has an A record in it
    10. Go to CloudWatch service
    11. Select log-groups and check if all applications are ok

## Situation 3 - Site is not responding with alarm
    1. Go to AWS Console
    2. Select EC2 service
    3. Select instances from the left menu
    4. Check that IJM instance is in place and healthy
    5. Select Target groups
    6. Select application target group and go to Targets tab
    7. Ensure there`s at least 1 instance registered against this target group
    8. Check application logs in CloudWatch
    9. Connect to the instance
    10. Check containers status with `docker ps`
    11. Check there`s a free space with `df -h`
    12. Redeploy the application from GitHub Actions

## Situation 4 - Assets CI pipeline has failed
    1. Connect to the EC2 instance and check free space with `df -h`
    2. Delete old docker images and volumes, if there`re any
    3. Re-run Assets CI
        * The long run solution would be create a volume in AWS and mount it as a data folder 

