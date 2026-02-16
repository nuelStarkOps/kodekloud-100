**Create an EC2. Instance with the following requirements**

- The name of the instance must be datacenter-ec2.

- You can use the Amazon Linux AMI to launch this instance.

- The Instance type must be t2.micro.

- Create a new RSA key pair named datacenter-kp.

- Attach the default (available by default) security group.

```bash
# create keypair 
aws ec2 create-key-pair --key-name datacenter-kp --query 'KeyMaterial'. --output text > datacenter-kp.pem

# --query saves the keypair to your local machine

# adjust permissions for the keypair
chmod 400 datacenter-kp.pem

# launch ec2 instance
aws ec2 run-instances \
--image-id <amazon linux AMI ID> \
--instance-type t2.micro \
--key-name datacenter-kp \
--security-group-ids <default security group ID> \
--subnet-id <default subnet ID> \
--count 1 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=datacenter-ec2}]'

# verify the ec2 instance
aws ec2 describe-instances 
```
