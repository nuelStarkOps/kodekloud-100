- Install tomcat server on App Server 2.

- Configure it to run on port 5004.

- There is a ROOT.war (package for webapp files) file on Jump host at location /tmp.


***set up connection between jump host and app server***
```bash
# enable ssh passthrough between jump host and app server
ssh-keygen -t rsa -b 2048
ssh-copy-id <uuser>@<appserver_ip>

# install tomcat on appserver
ssh <user>@<appserver_ip>
sudo dnf install tomcat -y

# configure Tomcat to Run on Port 5004
sudo vi /etc/tomcat/server.xml
```

***change 8080 to 5004***

```XML
<Connector port="8080" protocol="HTTP/1.1" 
```
to

```XML
<Connector port="5004" protocol="HTTP/1.1" 
```

***Deploy ROOT.war***
```bash
# copy ROOT.war from jump host to appserver2
scp /tmp/ROOT.war <user2>@<server2-ip>:/tmp/

# move ROOT.war to appserver2 to tomcat/webapps folder
sudo mv /tmp/ROOT.war /var/lib/tomcat/webapps/

# change ownership to 'tomcat' user
sudo chown tomcat:tomcat /var/lib/tomcat/webapps/ROOT.war

# restart tomcat and check status
sudo systemctl eenable tomcat
sudo systemctl restart tomcat
sudo systemctl status tomcat

# verify deployment
ls -l /var/lib/tomcat/webapps/ROOT/ # webapp files should be extracted and listed

curl http://localhost:5004
```
