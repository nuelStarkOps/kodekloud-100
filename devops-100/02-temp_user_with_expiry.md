# Linux User Management - temporary user with expiry

**task - create a temporary user "user-name" with an expiry date of 2027-03-28**

```bash
sudo useradd -e 2027-03-28 user-name

#verify the user was created
id user-name

#verify the expiry date
chage -l user-name
```