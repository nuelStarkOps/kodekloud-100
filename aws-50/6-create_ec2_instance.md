**Create an EC2. Instance with the following requirements**

- The name of the instance must be ec2-name.

- You can use the Amazon Linux AMI to launch this instance.

- The Instance type must be t2.micro.

- Create a new RSA key pair named keypair-name.

- Attach the default (available by default) security group.

```bash
# create keypair 
aws ec2 create-key-pair --key-name keypair-name --query 'KeyMaterial'. --output text > keypair-name.pem

# --query saves the keypair to your local machine

# adjust permissions for the keypair
chmod 400 keypair-name.pem

# launch ec2 instance
aws ec2 run-instances \
--image-id <amazon linux AMI ID> \
--instance-type t2.micro \
--key-name keypair-name \
--security-group-ids <default security group ID> \
--subnet-id <default subnet ID> \
--count 1 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=ec2-name}]'

# verify the ec2 instance
aws ec2 describe-instances 
```
