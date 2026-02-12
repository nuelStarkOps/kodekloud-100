**task - create a custom apache user "rose",  UID 1326 and set her home directory to /var/www/rose**

```bash
# Create the user
sudo useradd -u 1326 -d /var/www/rose -s /bin/bash rose

# Create the home directory
sudo mkdir -p /var/www/rose

# Set the ownership of the home directory
sudo chown rose:rose /var/www/rose

# Set the permissions of the home directory
sudo chmod 755 /var/www/rose

# Set the password for the user
sudo passwd rose

# Verify the user was created
id rose

# Verify the home directory was created
ls -ld /var/www/rose
```
