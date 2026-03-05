- An instance named ec2-name and an elastic network interface named eni-name already exists in us-east-1 region.
- Attach the eni-name network interface to the ec2-name instance.
- Make sure status is attached before submitting the task.
- Please make sure instance initialisation has been completed before submitting this task.


***get instance id***
```bash
aws ec2 describe-instances --filter "Name=tag:Name,Values=ec2-name" --query "Reservations[].Instances[].InstanceId" --output text
```

it prints ,instance-id> - in my case <instance-id>

***confurm ENI id***
```bash
aws ec2 describe-network-interfaces \
  --query "NetworkInterfaces[].{ENI:NetworkInterfaceId,Attachment:Attachment.AttachmentId,Status:Status}" \
  --output table
```

it prints an ENI attachment id with 1/more attachments and if theey're available o in use. only available ones will work

<eni-id>

***attach ENI to ec2 instance***
```bash
aws ec2 attach-network-interface \
  --instance-id <instance-id> \
  --network-interface-id <eni-id> \
  --device-index 1

