**Install ansible version 4.7.0 on Jump host using pip3 only. Make sure Ansible binary is available globally on this system, i.e all users on this system are able to run Ansible commands.**

```bash
# install pip3
sudo dnf update
sudo dnf install python3-pip -y

# install ansible version 4.7.0
sudo pip3 install ansible==4.7.0

# verify the installation
ansible --version
```
