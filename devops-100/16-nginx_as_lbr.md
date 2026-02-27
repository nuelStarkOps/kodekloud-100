# Nginx Load Balancer Setup for App servers setup

This document describes the step-by-step procedure to set up **Nginx on the Load Balancer (LBR) server** to load-balance Apache web servers running on multiple app servers in Stratos Datacenter.

---

## Prerequisites

- Apache is already installed and running on all app servers.
- Apache ports on app servers are **already defined** and must **not be changed**.
- IP addresses of app servers:

  | Server     | IP           | Apache Port |
  |-----------|--------------|------------|
  | App Server 1 | 172.16.238.10 | 6000       |
  | App Server 2 | 172.16.238.11 | 6000       |
  | App Server 3 | 172.16.238.12 | 6000       |

- LBR server is accessible from the jump host.

---

## Step 1 — Install Nginx on LBR

1. Install EPEL repository and Nginx:

```bash
sudo yum install -y epel-release
sudo yum install -y nginx
````

2. Enable and start Nginx:

```bash
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx
```

---

## Step 2 — Verify Apache on App Servers

1. Check Apache service status on each app server:

```bash
sudo systemctl status httpd
```

2. Confirm Apache is listening on the correct port:

```bash
sudo ss -tulpn | grep httpd
```

> Example output:
> `tcp LISTEN 0 511 0.0.0.0:6000 0.0.0.0:* users:(("httpd",pid=1683,fd=3))`

* Note the port number (here `6000`) — it will be used in Nginx upstream configuration.
* Ensure nothing else is using this port:

```bash
sudo lsof -i :6000
```

---

## Step 3 — Update Nginx Configuration on LBR

1. Open the main Nginx configuration file:

```bash
sudo vi /etc/nginx/nginx.conf
```

2. Add the **upstream block** and modify the server block to proxy traffic to app servers. Example:

```nginx
http {

    upstream app_servers {
        server 172.16.238.10:6000;
        server 172.16.238.11:6000;
        server 172.16.238.12:6000;
    }

    server {
        listen 80;
        listen [::]:80;
        server_name _;

        location / {
            proxy_pass http://app_servers;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        error_page 404 /404.html;
        location = /404.html { }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html { }
    }
}
```

> ⚠️ Important:
>
> * Keep everything else in the `nginx.conf` intact.
> * Do not modify `/etc/nginx/conf.d/*.conf` files.
> * Do not change Apache ports on app servers.

---

## Step 4 — Test and Restart Nginx

1. Test configuration:

```bash
sudo nginx -t
```

2. Restart Nginx to apply changes:

```bash
sudo systemctl restart nginx
```

---

## Step 5 — Open Firewall on LBR (if required)

1. Check if firewall is active:

```bash
sudo systemctl status firewalld
```

2. Open port 80 for HTTP:

```bash
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload
```

---

## Step 6 — Verify Load Balancer

1. From jump host or another client, test access:

```bash
curl http://<LBR-IP>
```

2. Optional: Verify load balancing works:

* On each app server, temporarily modify the `index.html` to display hostname:

```bash
hostname | sudo tee /var/www/html/index.html
```

* Run repeated curl commands to LBR:

```bash
curl http://<LBR-IP>
```

* You should see responses rotating between app servers, confirming round-robin load balancing.

---

## Step 7 — Notes and Best Practices

* Nginx upstream uses **round-robin** by default.
* Apache ports must **remain unchanged**.
* If using HTTPS later, configure SSL in the LBR server separately.
* Always validate `nginx -t` before restarting to avoid downtime.

---

```

---
