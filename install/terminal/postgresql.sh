sudo apt install -y postgresql postgresql-contrib libpq-dev postgresql-client postgresql-client-common pgcli

# TODO: enable password auth (md5) instead of peer for adminer
# TODO: create database user
# TODO: use variable for user name
sudo -u postgres createuser --superuser andrius
sudo -u postgres psql -c "ALTER USER andrius PASSWORD 'andrius';"
