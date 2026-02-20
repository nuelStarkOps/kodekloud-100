There is an instance named datacenter-ec2 and an elastic-ip named datacenter-ec2-eip in us-east-1 region. Attach the datacenter-ec2-eip elastic-ip to the datacenter-ec2 instance.

```bash
# check if instance and elastic ip address exist
aws ec2 describe-instances --filters "Name=tag:Name,Values=datacenter-ec2" --query "Reservations[].Instances[].InstanceId" --output text

aws ec2 describe-addresses --filters "Name=tag:Name,Values=datacenter-ec2-eip" --query "Addresses[].AllocationId" --output text

# create elastic ip if it doesn't exist

aws ec2 allocate-address --domain vpc --tag-specifications 'ResourceType=elastic-ip,Tags=[{Key=Name,Value=datacenter-ec2-eip}]'

# associate it with the datacenter-ec2 instance
aws ec2 associate-address --instance-id <instance-id> --allocation-id <allocation-id>
```

