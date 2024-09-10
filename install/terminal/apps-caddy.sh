# installing caddy and php-fpm
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install -y caddy php-fpm

# setup app directory
sudo mkdir -p /srv/www/localhost
cat <<EOL | sudo tee /srv/www/localhost/index.html > /dev/null
<!DOCTYPE html>
<html>
<body>

<a href="http://adminer.localhost">adminer</a>

</body>
</html>
EOL

# setup adminer
sudo mkdir -p /srv/www/adminer
wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /srv/www/adminer/index.php


cat <<EOL | sudo tee /etc/caddy/Caddyfile > /dev/null
localhost:80 {
        root * /srv/www/localhost
        file_server
}

adminer.localhost:80 {
        root * /srv/www/adminer
        php_fastcgi unix//run/php/php-fpm.sock
        file_server
}
EOL
 
sudo systemctl restart caddy
