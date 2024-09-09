# Exit immediately if a command exits with a non-zero status
set -e

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

echo "Installing terminal and desktop tools.."

# Install terminal tools
source ~/.local/share/omakub/install/terminal.sh

# Install desktop tools and tweaks
source ~/.local/share/omakub/install/desktop.sh

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

sudo reboot
