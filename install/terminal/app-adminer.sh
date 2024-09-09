# TODO: configure either local nginx or caddy and deploy this or make docker work
# try using psql from container to see if i can reach it using username and passowrd auth
#sudo docker run -d -it --restart unless-stopped  -p "127.0.0.1:8080:80" --name=adminer -e ADMINER_SERVER=postgres16 -e ADMINER_USERNAME=postgres -e ADMINER_PASSWORD=postgres dockette/adminer:dg