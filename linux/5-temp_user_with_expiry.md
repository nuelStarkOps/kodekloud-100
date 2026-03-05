# Linux User With Expiry Date

create a temporary linux user user-name with an expiry date set for 2026-05-31

```bash
# create the user
sudo useradd -e 2026-05-31 user-name

# verify expiry date
sudo chage -l user-name
```

