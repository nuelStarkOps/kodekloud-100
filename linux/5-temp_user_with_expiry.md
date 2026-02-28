# Linux User With Expiry Date

create a temporary linux user david with an expiry date set for 2026-05-31

```bash
# create the user
sudo useradd -e 2026-05-31 david

# verify expiry date
sudo chage -l david
```

