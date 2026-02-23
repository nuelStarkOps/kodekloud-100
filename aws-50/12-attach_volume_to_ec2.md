An instance named devops-ec2 and a volume named devops-volume already exists in us-east-1 region. Attach the devops-volume volume to the devops-ec2 instance, make sure to set the device name to /dev/sdb while attaching the volume.

***get instance id and volume id***

```bash
aws ec2 describe-instance --filter "Name=tag:Name,Values=devops-ec2" --query "Reservations[].Instances[].InstanceId" --output text

# --> i-09ad9c5dd982d205b

aws ec2 describe-volumes --filter "Name=tag:Name,Values=devops-volume" --query "Volumes[].VolumeId" --output text

# --> vol-01497e26e4503dd6e
```

***attach volume to instance***

```bash
aws ec2 attach-volume \
  --volume-id vol-0222880c7331bb06f \
  --instance-id i-09ad9c5dd982d205b \
  --device /dev/sdb
```

***verify volume is attached***

aws describe-volumes --volume-id vol-0222880c7331bb06f

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
 