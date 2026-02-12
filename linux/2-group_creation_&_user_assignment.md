**task - create the user group "nautilus_admin_users" on all 3 app servers and add "sonya" to the group. create the user Sonya if it doesn't exist**

```bash
#create the group
sudo groupadd nautilus_admin_users

#create the sonya user
sudo useradd sonya -aG nautilus_admin_users

#verify the user was created
id sonya

#verify the group was created
group sonya
```
