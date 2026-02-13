**task -  disable direct root login onn all app servers**

edit the /etc/ssh/sshd_config file and set the PermitRootLogin parameter to no

```bash
# edit the /etc/ssh/sshd_config file
sudo nano /etc/ssh/sshd_config

# set the PermitRootLogin parameter to no
PermitRootLogin no

# restart the ssh service
sudo systemctl restart sshd
```
