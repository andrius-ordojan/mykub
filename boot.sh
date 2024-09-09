set -e

echo "Installing Mykub"

sudo apt update -y
sudo apt install -y wget unzip git

# TODO: clone into projects instead and change every config to be soft linked
TARGET_DIR=~/.local/share/mykub
mkdir -p $TARGET_DIR
wget -P $TARGET_DIR https://github.com/andrius-ordojan/mykub/archive/refs/heads/main.zip
cd $TARGET_DIR
unzip main.zip
rm main.zip

source $TARGET_DIR/install.sh
