**change the instance type of ec2-name from t2.micro to t2.nano and ensure the instance is in the running state afterwards**

```bash
# get the instance id
aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=ec2-name" \
  --query "Reservations[].Instances[].InstanceId" \
  --output text

# stop the instance
aws ec2 stop-instances --instance-ids <instance-id>

# modify the instance type
aws ec2 modify-instance-attribute --instance-id <instance-id>  --instance-type "Value=t2.nano"

# start the instance
aws ec2 start-instances --instance-id <instance-id>

# verify the instance type
aws ec2 describe-instances --instance-id <instance-id> --query "Reservations[0].Instances[0].InstanceType"
```