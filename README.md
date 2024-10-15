***Terraform AWS VPC Setup***

This project sets up a fully functional AWS VPC with public and private subnets, along with an EC2 instance running NGINX in the public subnet. 

The infrastructure is built using Terraform.

***Features***

Creation of a VPC with public and private subnets.
NGINX EC2 instance in the public subnet with a public IP address.
Route tables for public and private subnets.
Security groups for controlled access to the NGINX instance and the NAT instance.

***Prerequisites***

Terraform installed.

AWS credentials configured in your environment (e.g., via ~/.aws/credentials or environment variables).

Permission to create EC2 instances, security groups, VPCs, and subnets. 

Note: If you do not have permission to create Elastic IPs or NAT Gateways, you can make use of NAT Instances as an alternative.


***Directory Structure***


├── ec2.tf                # EC2 instance setup

├── outputs.tf            # Terraform output values (public IPs, etc.)

├── provider.tf           # AWS provider configuration

├── security_groups.tf    # Security groups definition

├── subnets.tf            # Public and private subnet definitions

├── vpc.tf                # VPC, Internet Gateway, and Route Tables

├── variables.tf          # Input variables for the Terraform project

├── README.md             # This readme file
