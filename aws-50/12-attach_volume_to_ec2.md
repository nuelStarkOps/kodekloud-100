An instance named ec2-name and a volume named volume-name already exists in us-east-1 region. Attach the volume-name volume to the ec2-name instance, make sure to set the device name to /dev/sdb while attaching the volume.

***get instance id and volume id***

```bash
aws ec2 describe-instance --filter "Name=tag:Name,Values=ec2-name" --query "Reservations[].Instances[].InstanceId" --output text

# --> <instance-id>

aws ec2 describe-volumes --filter "Name=tag:Name,Values=volume-name" --query "Volumes[].VolumeId" --output text

# --> <volume-id>
```

***attach volume to instance***

```bash
aws ec2 attach-volume \
  --volume-id <volume-id> \
  --instance-id <instance-id> \
  --device /dev/sdb
```

***verify volume is attached***

aws describe-volumes --volume-id <volume-id>

***Real World Use Case(s)***
 - Attaching additional storage to EC2 instances
 - Migrating data between instances
 - Creating persistent storage for applications
 - Disaster recovery and backups
 - Separating data from compute for easier management
 - Scaling storage independently of compute
 - Creating snapshots for backup and recovery
 - Migrating data to different Availability Zones
 - Creating encrypted volumes for security
 - Creating read-only volumes for data integrity
 - Creating volumes with different performance characteristics (gp2, io1, etc.)
 - Creating volumes with different storage types (gp2, io1, etc.)
 