**task - create the user group "group-name" on all 3 app servers and add "user-name" to the group. create the user user-name if it doesn't exist**

```bash
#create the group
sudo groupadd group-name

#create the user-name user
sudo useradd user-name -aG group-name

#verify the user was created
id user-name

#verify the group was created
group user-name
```
