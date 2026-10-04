# docker

## nginx (`nginx/`)
Static site served by nginx 1.27 with Let's Encrypt (certbot) auto-renew.

- `docker-compose.yml` — `nginx` (80/443) + `certbot` (renew loop)
- `data/nginx/app.conf` — gzip, HTTP->HTTPS redirect, HSTS, long cache for assets, no-cache for html
- `data/nginx/index.html` — site root
- `init-letsencrypt.sh` — first-time certificate bootstrap

## Setup
```bash
sudo apt install -y docker-compose-v2 curl      # or docker-compose
cd ~/install/dotfiles/modules/docker/nginx
# 1. Replace test1.org / www.test1.org with your domain in app.conf AND init-letsencrypt.sh; set email there
# 2. Point DNS A record to this host, open ports 80/443
./init-letsencrypt.sh        # needs the legacy `docker-compose` binary; set staging=1 to test
docker compose up -d
```

## Verify
`curl -I http://localhost` (expects 301 to https when host matches the domain)
