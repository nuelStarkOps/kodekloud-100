**task - create a subnet named datacenter-subnet in the default vpc in the us-east-1 region**

login to the aws console and create a subnet named "datacenter-subnet" in the default vpc in the us-east-1 region.

OR using CLI ...

```bash
#create the subnet
aws ec2 create-subnet --vpc-id <vpc-id> --cidr-block <cidr-block>

#delete the subnet
aws ec2 delete-subnet --subnet-id <subnet-id>
```