**task - create security group for the app server**

open the aws console and create a security group named "sg-name" in the us-east-1 region. add the following inbound rules:

- ssh (tcp/22) from anywhere (0.0.0.0/0)
- http (tcp/80) from anywhere (0.0.0.0/0)
- https (tcp/443) from anywhere (0.0.0.0/0)

OR using CLI . . .

```bash
#create the security group
aws ec2 create-security-group --group-name sg-name --description "security group for EC2 instance"

#add inbound rules
aws ec2 authorize-security-group-ingress --group-name sg-name --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name sg-name --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name sg-name --protocol tcp --port 443 --cidr 0.0.0.0/0

#verify the security group was created
aws ec2 describe-security-groups --group-names sg-name

#delete the security group
aws ec2 delete-security-group --group-name sg-name
```