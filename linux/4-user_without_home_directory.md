**Create a user named ravi in App Server 3 without a home directory.**

```bash
# ssh into app3 server
ssh <user>@<app3-server-ip>

# create the user
useradd -M ravi

# verify the user
id ravi
```