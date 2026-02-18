**enable stop protection on xfusion-ec2 instance**

```bash
# get the instance id
aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=xfusion-ec2" \
  --query "Reservations[].Instances[].InstanceId" \
  --output text

# enable stop protection
aws ec2 modify-instance-attribute \
  --instance-id <instance-id> \
  --disable-api-stop "`{\"Value\":true}"
```

