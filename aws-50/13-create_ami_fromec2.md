create an ami from the ec2-name instance already running in the us-east-1 region

the ami should be named ec2-ami-name and should be in the available state

## get the instance id for the ec2-name instance
aws ec2 describe-instances --filters "Name=tag:Name,Values=ec2-name" --query "Reservations[*].Instances[*].InstanceId" --output text

## create the ami
aws ec2 create-image --instance-id <instance-id> --name "ec2-ami-name" --description "AMI for ec2-name instance"

## verify the ami is created and in available state
aws ec2 describe-images --filters "Name=name,Values=ec2-ami-name" --query "Images[*].State" --output text