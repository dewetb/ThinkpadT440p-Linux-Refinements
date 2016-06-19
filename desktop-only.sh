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

sudo add-apt-repository ppa:kilian/f.lux
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update

# This is not needed for Linux Mint
#sudo apt-get -y ubuntu-restricted-extras vlc libreoffice-base gimp

echo "\n apt-get install stuff \n"
sudo apt-get -y install google-chrome-stable sublime-text skype dropbox python-gpgme audacity klavaro git-gui virtualbox-5.0 aria2 autokey-gtk atom fluxgui

sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y purge
