# Linux Script Execution Permissions

**task - grant executable permissions to /tmp/companyname.sh script on App Server 3. ensure that all users have the capability to execute it**

```bash
#grant executable permissions
sudo chmod 755 /tmp/companyname.sh

# verify the permissions
ls -l /tmp/companyname.sh
```

