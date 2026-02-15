**Create a volume with the following requirements:**

- Name of the volume should be xfusion-volume.
- Volume type must be gp3.
- Volume size must be 2 GiB

```bash
# create the volume
aws ec2 create-volume --volume-type gp3 --size 2 --availability-zone us-east-1a

# verify the volume
aws ec2 describe-volumes --volume-ids <volume-id>

# verify the volume
aws ec2 describe-volumes --volume-ids <volume-id>
```
