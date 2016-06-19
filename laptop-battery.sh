# Install TLP or any other laptop battery savings tools
echo "\n First I'll try to install everything that you can walk away for \n"

######## Initial Update & Upgrade

sudo apt-get -y update
sudo apt-get -y dist-upgrade

# Remove things that conflict with tlp
sudo apt-get remove laptop-mode-tools
######## Adding Software Sources

echo "\n Adding Software Sources \n"
# Chrome
#if [ ! -f "/etc/apt/sources.list.d/google.list" ]; then
#  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#  sudo sh -c 'echo "\n deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#fi
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update

echo "\n apt-get install stuff \n"
sudo apt-get -y install tlp tlp-rdw tp-smapi-dkms acpi-call-tools

sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y purge
