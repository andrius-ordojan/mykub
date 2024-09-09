set -e

echo "Installing Mykub"

sudo apt update -y
sudo apt install -y wget unzip git

git clone https://github.com/andrius-ordojan/mykub.git ~/.local/share/mykub

echo ho
source ~/.local/share/mykub/install.sh
