# EC2 instance termination

Terminate the ec2-name instance located in the us-east-1 region. 


```bash
aws ec2 describe-instances --filter "Name=tag:Name,Values=ec2-name" --query "Reservations[].Instances[].InstanceId" --output text

# --> <instance-id>

aws ec2 terminate-instances --instance-id <instance-id>
```