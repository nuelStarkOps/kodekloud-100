**An instance named devops-ec2 already exists in us-east-1 region. Enable termination protection for the same.**

```bash
# get the instance id
aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=devops-ec2" \
  --query "Reservations[].Instances[].InstanceId" \
  --output text

--> i-0fae4f83ecd497b8a

# enable termination protection
aws ec2 modify-instance-attribute \
  --instance-id i-0fae4f83ecd497b8a \
  --disable-api-termination
```