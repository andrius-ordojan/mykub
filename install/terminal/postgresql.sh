sudo apt install -y postgresql-16 postgresql-contrib libpq-dev postgresql-client postgresql-client-common pgcli

# TODO: enable password auth (md5) instead of peer for adminer
# TODO: create database user
# TODO: use variable for user name
sudo -u postgres createuser --superuser andrius
sudo -u postgres psql -c "ALTER USER andrius PASSWORD 'andrius';"


/etc/postgresql/16/main/pg_hba.conf
host    all             all             127.0.0.1/32            md5
change from peer


/etc/postgresql/16/main/postgresql.conf
listen_addresses = 'localhost'
uncomment
