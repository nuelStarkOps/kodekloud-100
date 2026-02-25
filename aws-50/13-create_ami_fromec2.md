create an ami from the nautilus-ec2 instance already running in the us-east-1 region

the ami should be named nautilus-ec2-ami and should be in the available state

## get the instance id for the nautilus-ec2 instance
aws ec2 describe-instances --filters "Name=tag:Name,Values=nautilus-ec2" --query "Reservations[*].Instances[*].InstanceId" --output text

## create the ami
aws ec2 create-image --instance-id <instance-id> --name "nautilus-ec2-ami" --description "AMI for nautilus-ec2 instance"

## verify the ami is created and in available state
aws ec2 describe-images --filters "Name=name,Values=nautilus-ec2-ami" --query "Images[*].State" --output text