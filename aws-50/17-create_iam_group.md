# Creating an IAM Group

Create an IAM group named 'developers' in the us-east-1 region

```bash
aws iam create-group --group-name developers
```

---

## Optional

### add users to the group

```bash
aws iam add-user-to-group --user-name devops-user --group-name developers
```

### attach a policy to the group

```bash
aws iam attach-group-policy --group-name developers --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```