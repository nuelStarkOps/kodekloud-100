# Creating a New IAM User

Create a new IAM user named 'iam-user-name' in the us-east-1 region


## create the IAM user

```bash
aws iam create-user --user-name iam-user-name
```

## Optional

### create an access key for the user

```bash
aws iam create-access-key --user-name iam-user-name
```

### create a group and add the user to the group

```bash
aws iam create-group --group-name iam-group-name
aws iam add-user-to-group --user-name iam-user-name --group-name iam-group-name
```

### attach a policy to the group

```bash
aws iam attach-group-policy --group-name iam-group-name --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```
