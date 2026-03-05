# Creating an IAM Group

Create an IAM group named 'iam-group-name' in the us-east-1 region

```bash
aws iam create-group --group-name iam-group-name
```

---

## Optional

### add users to the group

```bash
aws iam add-user-to-group --user-name iam-user-name --group-name iam-group-name
```

### attach a policy to the group

```bash
aws iam attach-group-policy --group-name iam-group-name --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```