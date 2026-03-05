# SSL for Nginx

The system admins team of CompanyName Industries needs to deploy a new application on App Server 2 in Sample Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:

1. Install and configure nginx on App Server 2.

2. On App Server 2 there is a self signed SSL certificate and key present at location /tmp/ssl-cert-name.crt and /tmp/ssl-key-name.key. Move them to some appropriate location and deploy the same in Nginx.

3. Create an index.html file with content Welcome! under Nginx document root.

4. For final testing try to access the App Server 2 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/.



## install nginx on app-server 2

```bash
ssh <app-server-user>@<app-server-ip>
sudo yum install nginx -y
```

## move the SSL certificate and key to appropriate location

### create the ssl directory

```bash
sudo mkdir -p /etc/nginx/ssl
```

### move the SSL certificate and key to appropriate location

```bash
sudo mv /tmp/ssl-cert-name.crt /etc/nginx/ssl/
sudo mv /tmp/ssl-key-name.key /etc/nginx/ssl/
```

## edit permissions and ownership for ceertificate and key

```bash
sudo chown root:nginx ssl/ssl-key-name.key
sudo chmod 640 ssl/ssl-key-name.key
sudo chmod 644 ssl/ssl-cert-name.crt
```

## create the nginx server block for SSL

```bash
sudo vi /etc/nginx/conf.d/ssl.conf
```

```nginx
server {
    listen 443 ssl;
    server_name <app-server-ip>;

    ssl_certificate     /etc/nginx/ssl/ssl-cert-name.crt;
    ssl_certificate_key /etc/nginx/ssl/ssl-key-name.key;

    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

## create the index.html file

```bash
echo "Welcome!" | sudo tee /usr/share/nginx/html/index.html
```

## test the SSL

```bash
sudo nginx -t
```
![nginx test](./15-test_nginx_app_server.png)


## restart nginx

```bash
sudo systemctl restart nginx
```

## test on the jump host

```bash
curl -Ik https://<app-server-ip>
```

![jump host curl test](./15-curl_test_successful(jump_host).png)

***--> Note that Content-Length is 9 (same as "Welcome!" including the new line)***