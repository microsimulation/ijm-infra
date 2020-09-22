
| Name 	                    | Type 	| Comments 	    |
|:------------------------- |:------|:-------------	|
| ELF-IJM-Instance | EC2 instance |  |
|   | EIP | Associated with EC2 instance |
| ELF-IJM-ALB | ELB - Application type |  |
| ELF-IJM-EC2-TG | Target group | For application |
| IJM-IIIF-TG | Target group | For image server |
| ijm-elife-assets-bucket | S3 bucket | Bucket for Assets CI |
| ijm-elife-devops-bucket | S3 bucket | Bucket for terraform |
| ijm-exeter-content-bucket | S3 bucket | Bucket for new content from Exeter |
| ijm-api | ECR repository |  |
| ijm-journal | ECR repository |  |
| ijm-web | ECR repository |  |
| ijm-api-docker | CloudWatch Log group |  |
| ijm-iiif-docker | CloudWatch Log group |  |
| ijm-journal-docker | CloudWatch Log group |  |
| ijm-web-docker | CloudWatch Log group |  |
| microsimulation.pub | Route 53 Hosted Zone |  |
| microsimulation.pub | ACM SSL Certificate |  |
