**task - create a user named "siva" with a non-interactive shell**

```bash
sudo useradd -s /sbin/nologin siva

#verify the user was created
id siva

#verify the shell was set
getent passwd siva
```