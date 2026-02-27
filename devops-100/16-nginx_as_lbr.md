# Installing nginx as LBR

a. Install nginx on LBR (load balancer) server.


b. Configure load-balancing with the an http context making use of all App Servers. Ensure that you update only the main Nginx configuration file located at /etc/nginx/nginx.conf.


c. Make sure you do not update the apache port that is already defined in the apache configuration on all app servers, also make sure apache service is up and running on all app servers.


d. Once done, you can access the website using StaticApp button on the top bar.

## install nginx on lbr server

```bash
ssh <lbr-server-user>@<lbr-server-ip>
sudo yum install nginx -y
```

## configure load-balancing

```bash
sudo vi /etc/nginx/nginx.conf
```

```nginx
upstream backend {
    server <app-server-1-ip>;
    server <app-server-2-ip>;
    server <app-server-3-ip>;
}

server {
    listen 80;
    server_name <lbr-server-ip>;

    location / {
        proxy_pass http://backend;
    }
}
```

## restart nginx

```bash
sudo systemctl restart nginx
```

## test on the jump host

```bash
curl -Ik http://<lbr-server-ip>
```