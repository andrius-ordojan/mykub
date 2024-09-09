docker run -d --restart unless-stopped --network local -p "127.0.0.1:8080:8080" --name=adminer -e ADMINER_DEFAULT_USER="postgres" -e ADMINER_DEFAULT_SERVER=localhost  adminer
docker run -d --restart unless-stopped --network local -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16.3-bookworm
docker run -d -it --restart unless-stopped --network local -p "127.0.0.1:8080:80" --name=adminer -e ADMINER_SERVER=postgres16 -e ADMINER_USERNAME=postgres -e ADMINER_PASSWORD=postgres dockette/adminer:dg
