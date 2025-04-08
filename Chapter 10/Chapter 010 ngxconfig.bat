server {
    listen 80;
    server_name your_superset_domain.com;

    location / {
        return 301 https://$host$request_uri;
    }
}

server {
    listen 443 ssl;
    server_name your_superset_domain.com;

    ssl_certificate /etc/letsencrypt/live/your_superset_domain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/your_superset_domain.com/privkey.pem;

    location / {
        proxy_pass http://superset:8088;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
