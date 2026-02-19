**There is a critical issue going on with the Nautilus application in Stratos DC. The production support team identified that the application is unable to connect to the database. After digging into the issue, the team found that mariadb service is down on the database server.**

```bash
# check if mariadb is running
sudo systemctl status mariadb

# start mariadb
sudo systemctl start mariadb

# enable mariadb
sudo systemctl enable mariadb
```

***errors faced***
[sudo] password for peter: 
○ mariadb.service - MariaDB 10.5 database server
     Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; preset: disabled)
     Active: inactive (dead) since Thu 2026-02-19 17:03:13 UTC; 8min ago
   Duration: 6.019s
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/en/library/systemd/
[peter@stdb01 ~]$ sudo systemctl start mariadb
Job for mariadb.service failed because the control process exited with error code.
See "systemctl status mariadb.service" and "journalctl -xeu mariadb.service" for details.

***fix - reinstall mariadb***

```bash
# install mariadb
sudo dnf install mariadb -y

# enable mariadb
sudo systemctl enable mariadb

# start mariadb
sudo systemctl start mariadb
```