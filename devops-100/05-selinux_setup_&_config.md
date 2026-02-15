**Following a security audit, the xFusionCorp Industries security team has opted to enhance application and server security with SELinux. To initiate testing, the following requirements have been established for App server 2 in the Stratos Datacenter:**

- Install the required SELinux packages.
- Permanently disable SELinux for the time being; it will be re-enabled after necessary configuration changes.
- No need to reboot the server, as a scheduled maintenance reboot is already planned for tonight.
- Disregard the current status of SELinux via the command line; the final status after the reboot should be disabled.


```bash
# ssh onto app2 server
ssh <user>@<app2-server-ip>

# install the required packages
sudo dnf install selinux-policy selinux-policy-targeted policycoreutils -y

# disable selinux
sudo setenforce 0

# verify selinux status
sudo getenforce

# edit /etc/selinux/config to permanently disable selinux
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# verify selinux status
sudo getenforce
```