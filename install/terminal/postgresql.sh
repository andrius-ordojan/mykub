sudo apt install -y postgresql-16 postgresql-contrib libpq-dev postgresql-client postgresql-client-common pgcli

sudo -u postgres createuser --superuser $USER
sudo -u postgres psql -c "ALTER USER $USER PASSWORD '$USER';"

# TODO: double check the line number
sed -i '125s/peer/md5/' /etc/postgresql/16/main/pg_hba.conf

sudo sed -i "s/port = 5433/port = 5432/" /etc/postgresql/16/main/postgresql.conf
sudo sed -i "/^#listen_addresses = 'localhost'/s/^#//" /etc/postgresql/16/main/postgresql.conf
