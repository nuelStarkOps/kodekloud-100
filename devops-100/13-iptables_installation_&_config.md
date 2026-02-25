## iptables installation and configuration
---

We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 6300 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:

1. Install iptables and all its dependencies on each app host.
2. Block incoming port 6300 on all apps for everyone except for LBR host.
3. Make sure the rules remain, even after system reboot.

***create a script to automate all the processes involved***

```bash
vi apache_LBR_only.sh
```
[view script here](./13-apache_LBR_only.sh)

***ssh into the 3 app servers and run the script***
```bash
ssh <app-server-user>@<app-server-ip>
bash apache_LBR_only.sh
```

***verify rules have applied***
```bash
sudo iptables -L -n -v
```

***test***
```bash
# test locally first on app server
curl http://localhost:6300
# test from jump host
curl http://<app-server-ip>:6300 # should fail from jump host and other servers

# test from LBR server
curl http://app-server-ip:6300 # should work from the LBR server
```
