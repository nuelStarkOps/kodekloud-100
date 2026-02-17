**Set up a password-less authentication from user thor on jump host to all app servers through their respective sudo users.**

```bash
# generate ssh key pair on jump host
ssh-keygen -t rsa -b 4096

# copy public key to all app servers
ssh-copy-id <user>@<app-server-ip>

# verify password-less login
ssh <user>@<app-server-ip>
```