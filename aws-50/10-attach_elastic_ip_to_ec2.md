There is an instance named ec2-name and an elastic-ip named ec2-eip-name in us-east-1 region. Attach the ec2-eip-name elastic-ip to the ec2-name instance.

```bash
# check if instance and elastic ip address exist
aws ec2 describe-instances --filters "Name=tag:Name,Values=ec2-name" --query "Reservations[].Instances[].InstanceId" --output text

aws ec2 describe-addresses --filters "Name=tag:Name,Values=ec2-eip-name" --query "Addresses[].AllocationId" --output text

# create elastic ip if it doesn't exist

aws ec2 allocate-address --domain vpc --tag-specifications 'ResourceType=elastic-ip,Tags=[{Key=Name,Value=ec2-eip-name}]'

# associate it with the ec2-name instance
aws ec2 associate-address --instance-id <instance-id> --allocation-id <allocation-id>
```

