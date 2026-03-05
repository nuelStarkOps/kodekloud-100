**task - enable versioning on the s3 bucket - s3-bucket-name**

- login to aws console
- navigate to s3 service
- click on the bucket name - s3-bucket-name
- click on the properties tab
- scroll down to the versioning section
- click on the edit button
- enable versioning
- save the changes

OR using aws cli

```bash
aws s3api put-bucket-versioning \
  --bucket s3-bucket-name \
  --versioning-configuration Status=Enabled
```