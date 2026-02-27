# Creating a New IAM User

Create a new IAM user named 'devops-user' in the us-east-1 region


## create the IAM user

```bash
aws iam create-user --user-name devops-user
```

## Optional

### create an access key for the user

```bash
aws iam create-access-key --user-name devops-user
```

### create a group and add the user to the group

```bash
aws iam create-group --group-name devops-group
aws iam add-user-to-group --user-name devops-user --group-name devops-group
```

### attach a policy to the group

```bash
aws iam attach-group-policy --group-name devops-group --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```
