**task - create a temporary user "ammar" with an expiry date of 2027-03-28**

```bash
sudo useradd -e 2027-03-28 ammar

#verify the user was created
id ammar

#verify the expiry date
chage -l ammar
```