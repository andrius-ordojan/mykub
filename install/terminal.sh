# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl

# Run terminal installers
for installer in ~/.local/share/mykub/install/terminal/*.sh; do source $installer; done
