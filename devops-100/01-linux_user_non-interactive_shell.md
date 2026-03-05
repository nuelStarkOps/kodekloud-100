# Linux User Management - non-interactive shell

**task - create a user named user-name with a non-interactive shell**

```bash
sudo useradd -s /sbin/nologin user-name

#verify the user was created
id user-name

#verify the shell was set
getent passwd user-name
```