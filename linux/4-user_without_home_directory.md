**Create a user named user-name in App Server 3 without a home directory.**

```bash
# ssh into app3 server
ssh <user>@<app3-server-ip>

# create the user
useradd -M user-name

# verify the user
id user-name
```