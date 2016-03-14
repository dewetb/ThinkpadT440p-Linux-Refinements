# Install Ubuntu desktop specific packages
echo "\n First I'll try to install everything that you can walk away for \n"

######## Initial Update & Upgrade

sudo apt-get -y update
sudo apt-get -y dist-upgrade

######## Adding Software Sources

echo "\n Adding Software Sources \n"
# Chrome
if [ ! -f "/etc/apt/sources.list.d/google.list" ]; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "\n deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
fi

# Enable MultiArch for Skype
sudo dpkg --add-architecture i386

# Skype
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo apt-get update

# This is not needed for Linux Mint
#sudo apt-get -y ubuntu-restricted-extras vlc

echo "\n Ubuntu desktop stuff unattended \n"
sudo apt-get -y install google-chrome-stable libreoffice libreoffice-core libreoffice-base sublime-text skype virtualbox dropbox python-gpgme gimp audacity klavaro

echo "\n Ubuntu Desktop stuff that needs you to choose config options to finish installing \n"
# sudo apt-get -y install

sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y purge
