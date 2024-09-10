# installing caddy and php
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install -y caddy php php-fpm

mkdir -p ~/.local/share/mykub/apps/adminer/
wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O ~/.local/share/mykub/apps/adminer/adminer.php


cat <<EOL > /etc/caddy/Caddyfile
localhost:80 {
    handle_path /adminer/* {
        root * ~/.local/share/mykub/apps/adminer/
        php_fastcgi unix//run/php/php-fpm.sock
        file_server
    }
}
EOL

sudo systemctl restart caddy
