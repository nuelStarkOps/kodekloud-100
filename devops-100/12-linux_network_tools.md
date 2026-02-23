check why the apache server is not working on the app server. Use telnet and netstat to troubleshoot.
make no changes to the index.html, and esure the apache webpage is accessible fromt he jump host on port 6100 without compromising security


***install teelnet and check webpage accessibility***
```bash
sudo dnf install telnet -y 
telnet <app-server-ip> 6100

# this should fail
```

***check appserver***
```bash
ssh <app-server-user>@<app-server-ip>
sudo systemctl status httpd

# should be inactive

sudo netstat -tulpn | grep 6100

# in this case another service is using port 6100. stop the app
sudo systemctl stop <service-name>

sudo vi /etc/httpd/conf/httpd.conf
# --> change Listen 80 to Listen 6100 and restart httpd

sudo systemctl restart httpd

sudo netstat -tulpn | grep 6100

# should be active and now show httpd
```

***test***
```bash
# test locally first on app server

curl http://localhost:6100 # this should work

# test from jump host

curl http://<app-server-ip>:6100 # this should work
# OR
telnet <app-server-ip> 6100 # this should work
```

***if it doesn't work***
check fireall rules on the app server

```bash
sudo firewall-cmd --list-all 
# add rule to allow port 6100
sudo firewall-cmd --add-port=6100/tcp --permanent
sudo firewall-cmd --reload


# if firewalld isn't present, check iptables rules
sudo iptables -L -n

# add rule to allow port 6100 temporarily
sudo iptables -I INPUT -p tcp --dport 6100 -j ACCEPT
```

***test again from jump host***
```bash
curl http://<app-server-ip>:6100 # this should now work
# OR
telnet <app-server-ip> 6100 # this should now work
```

