# EC2 instance termination

Terminate the xfusion-ec2 instance located in the us-east-1 region. 


```bash
aws ec2 describe-instances --filter "Name=tag:Name,Values=xfusion-ec2" --query "Reservations[].Instances[].InstanceId" --output text

# --> i-08cb599cf83a2377a

aws ec2 terminate-instances --instance-id i-08cb599cf83a2377a
```