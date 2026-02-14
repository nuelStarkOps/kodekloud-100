**task - enable versioning on the s3 bucket - xfusion-s3-22463**

- login to aws console
- navigate to s3 service
- click on the bucket name - xfusion-s3-22463
- click on the properties tab
- scroll down to the versioning section
- click on the edit button
- enable versioning
- save the changes

OR using aws cli

```bash
aws s3api put-bucket-versioning \
  --bucket xfusion-s3-22463 \
  --versioning-configuration Status=Enabled
```