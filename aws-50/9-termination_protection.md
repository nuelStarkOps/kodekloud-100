**An instance named ec2-name already exists in us-east-1 region. Enable termination protection for the same.**

```bash
# get the instance id
aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=ec2-name" \
  --query "Reservations[].Instances[].InstanceId" \
  --output text

--> <instance-id>

# enable termination protection
aws ec2 modify-instance-attribute \
  --instance-id <instance-id> \
  --disable-api-termination
```