# Linux Process Troubleshooting

check that Apche is working on all app servers and is reachable on port 8084

## check appserver1, 2, 3

```bash
# check if apache is serving on port 8084
curl http://<appserver1-ip>:8084
curl http://<appserver2-ip>:8084
curl http://<appserver3-ip>:8084
```

say 2, 3 are serving and 1 is not

## check appserver1

```bash
# check if apache is serving on port 8084
ssh <appserver1-user>@<appserver1-ip>
curl http://localhost:8084

# check if apache is running
sudo systemctl status httpd

# check if port 8084 is open
sudo netstat -tulpn | grep 8084

# close app using port 8084
sudo systemctl stop <service-name>
sudo systemctl disable <service-name>

# restart httpd
sudo systemctl restart httpd
sudo systemctl enable httpd

# check if port 8084 is open
sudo netstat -tulpn | grep 8084

# check if apache is serving on port 8084
curl http://localhost:8084

# temporarily allow port 8084 using iptables
sudo iptables -A INPUT -p tcp --dport 8084 -j ACCEPT

# check if port 8084 is open
sudo netstat -tulpn | grep 8084

# check if apache is serving on port 8084
curl http://localhost:8084  # should work

#check from jump host
curl http://<appserver1-ip>:8084  # should work
```


