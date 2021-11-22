# al-sesay25
Tech Challange-Coalfire
# Architecture
![Architecture](./images/architecture.png)

### Instruction

-	1 VPC – 10.1.0.0/16

-	4 subnets (spread across two availability zones for high availability)
        1. Sub1 – 10.1.0.0/24 (should be accessible from internet)
        2. Sub2 – 10.1.1.0/24 (should be accessible from internet)
        3. Sub3 – 10.1.2.0/24 (should NOT be accessible from internet)
        4. Sub4 – 10.1.3.0/24 (should NOT be accessible from internet)

-	1 compute instance running RedHat in subnet sub2
        1. 20 GB storage
        2. t2.micro

-	1 ASG running RedHat in subnet sub4 
        1. 20 GB storage
        2. Script the installation of apache on these instances
        3. 2 minimum, 6 maximum hosts
        4. t2.micro

-	1 alb that listens on port 80 and forwards traffic to the instance in sub4

-	Subnets should have security groups in place

-	1 S3 bucket with lifecycle policies
        1. Images folder move to glacier after 90 days
        2. Logs folder cleared after 90 days

### Commands to run the script
```
terrform init
terraform plan
terraform apply
```

### Screenshot of ssh 
![ssh](./images/ssh-image.png)

### URL
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
https://stackoverflow.com/questions/52519463/get-terraform-to-ignore-associate-public-ip-address-status-for-stopped-instanc
https://stackoverflow.com/questions/14494747/how-to-add-images-to-readme-md-on-github
