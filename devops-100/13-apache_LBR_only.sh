#!/bin/bash

# install iptables
sudo yum install -y iptables iptables-services
# iptables-services ensures you can save rules and have them persist across reboots.

# flush existing rules (clean slate)
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X


# allow Apache only from LBR host
# Allow LBR host to connect to port 6300
sudo iptables -A INPUT -p tcp -s lbr-server-ip --dport 6300 -j ACCEPT

# Drop everyone else to port 6300
sudo iptables -A INPUT -p tcp --dport 6300 -j DROP

# allow basic traffic
# Allow SSH
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow localhost
sudo iptables -A INPUT -i lo -j ACCEPT

# Allow established connections
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


# Optionally drop everything else by default
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT

# save rules for persistence
sudo service iptables save
sudo systemctl enable iptables
sudo systemctl start iptables

# verify rules
sudo iptables -L -n -v


#test with curl
curl http://lbr-server-ip:6300 # this should work from the LBR server
curl http://other-server-ip:6300 # this should fail frmo other servers