- An instance named nautilus-ec2 and an elastic network interface named nautilus-eni already exists in us-east-1 region.
- Attach the nautilus-eni network interface to the nautilus-ec2 instance.
- Make sure status is attached before submitting the task.
- Please make sure instance initialisation has been completed before submitting this task.


***get instance id***
```bash
aws ec2 describe-instances --filter "Name=tag:Name,Values=nautilus-ec2" --query "Reservations[].Instances[].InstanceId" --output text
```

it prints ,instance-id> - in my case i-0dc59f7b189907af4

***confurm ENI id***
```bash
aws ec2 describe-network-interfaces \
  --query "NetworkInterfaces[].{ENI:NetworkInterfaceId,Attachment:Attachment.AttachmentId,Status:Status}" \
  --output table
```

it prints an ENI attachment id with 1/more attachments and if theey're available o in use. only available ones will work

eni-085f02d6d8460bad8

***attach ENI to ec2 instance***
```bash
aws ec2 attach-network-interface \
  --instance-id i-0dc59f7b189907af4 \
  --network-interface-id eni-085f02d6d8460bad8 \
  --device-index 1

