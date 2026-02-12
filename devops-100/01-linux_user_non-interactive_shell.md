**task - create a user named dave with a non-interactive shell**

```bash
sudo useradd -s /sbin/nologin dave

#verify the user was created
id dave

#verify the shell was set
getent passwd dave
```