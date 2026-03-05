**task - create a custom apache user "user-name",  UID <uid> and set her home directory to /var/www/user-name**

```bash
# Create the user
sudo useradd -u 1326 -d /var/www/user-name -s /bin/bash user-name

# Create the home directory
sudo mkdir -p /var/www/user-name

# Set the ownership of the home directory
sudo chown user-name:user-name /var/www/user-name

# Set the permissions of the home directory
sudo chmod 755 /var/www/user-name

# Set the password for the user
sudo passwd user-name

# Verify the user was created
id user-name

# Verify the home directory was created
ls -ld /var/www/user-name
```
