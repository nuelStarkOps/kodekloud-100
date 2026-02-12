**task - create security group for the app server**

open the aws console and create a security group named "nautilus-sg" in the us-east-1 region. add the following inbound rules:

- ssh (tcp/22) from anywhere (0.0.0.0/0)
- http (tcp/80) from anywhere (0.0.0.0/0)
- https (tcp/443) from anywhere (0.0.0.0/0)

OR using CLI . . .

```bash
#create the security group
aws ec2 create-security-group --group-name nautilus-sg --description "security group for nautilus EC2 instance"

#add inbound rules
aws ec2 authorize-security-group-ingress --group-name nautilus-sg --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name nautilus-sg --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name nautilus-sg --protocol tcp --port 443 --cidr 0.0.0.0/0

#verify the security group was created
aws ec2 describe-security-groups --group-names nautilus-sg

#delete the security group
aws ec2 delete-security-group --group-name nautilus-sg
```