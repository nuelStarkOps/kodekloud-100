The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Stratos Datacenter, and they need to create a bash script named official_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 3).



- Create a zip archive named xfusioncorp_official.zip of /var/www/html/official directory.


- Save the archive in /backup/ on App Server 3. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.


- Copy the created archive to Nautilus Backup Server server in /backup/ location.

- Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.

- Do not use sudo inside the script.

***prepare the server***

```bash
# install zip and unzip
sudo dnf install zip unzip -y

# passwordless ssh
ssh-keygen -t rsa -b 2048
ssh-copy-id <bckup-user>@<backup-server-ip>
```

***create the script***

```bash
#!/bin/bash

# create the backup archive
zip -r xfusioncorp_official.zip /var/www/html/official

# copy the archive to backup server
scp xfusioncorp_official.zip <bckup-user>@<backup-server-ip>:/backup/
```

***make the script executable***

```bash
chmod +x official_backup.sh

# run the script
./official_backup.sh

# verify the backup
ls -l /backup/
```

***verify the backup on backup server***

```bash
ssh <bckup-user>@<backup-server-ip>
ls -l /backup/
```
