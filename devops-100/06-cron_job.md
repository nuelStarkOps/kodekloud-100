**task - install croniee on all the app servers and add a cron */5 * * * * echo hello > /tmp/cron_text for root user**

```bash
# install croniee on all the app servers
sudo dnf install cronie -y

# add a cron */5 * * * * echo hello > /tmp/cron_text for root user
sudo crontab -e
```

