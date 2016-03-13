# Install everything needed to set up an Ubuntu laptop for web development
echo "\n First I'll try to install everything that you can walk away for \n"

######## Initial Update & Upgrade

sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y install curl

######## Adding Software Sources

echo "\n Adding Software Sources \n"
# Chrome
if [ ! -f "/etc/apt/sources.list.d/google.list" ]; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "\n deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
fi

# Postgres
cd
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -

# Enable MultiArch for Skype
sudo dpkg --add-architecture i386

# Skype
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

sudo add-apt-repository -y ppa:webupd8team/sublime-text-2

sudo apt-get update

######## Install Things, Starting with the Essentials

echo "\n Install vim & zsh & other basics \n"
sudo apt-get -y install vim zsh git-core git

cd
if [ ! -d ".oh-my-zsh" ]; then
  sudo curl -L http://install.ohmyz.sh | sh
  chsh -s `which zsh`
fi

# Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  cd ~/.vim/bundle/Vundle.vim && git pull
  cd -
fi

######## Install Ruby & Rails

echo  "\n Instal Ruby dependencies from https://gorails.com/setup/ubuntu/14.04 \n"
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs librtmp-dev
cd

if [ ! -d ".rbenv" ]; then
  git clone git://github.com/sstephenson/rbenv.git .rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc
  exec $SHELL

  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc
  exec $SHELL

  git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

  rbenv install 2.3.0
  rbenv global 2.3.0
  echo "\n Next command should display ruby 2.3.0"
  ruby -v

  echo "gem: --no-ri --no-rdoc" > ~/.gemrc
  gem install bundler

  curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

  gem install rails -v 4.2.4

  rbenv rehash

  echo "\n Next command should display Rails 4.2.4"
  rails -v
fi

echo "\n configuring Git \n"
git config --global color.ui true
git config --global user.name "De Wet"
git config --global user.email "dewet@blomerus.org"

echo "\n Servers, databases & other misc web development stuff \n"
sudo apt-get -y install silversearcher-ag redis-server nginx apache2-utils phantomjs

echo "\n Postgres from https://gorails.com/setup/ubuntu/14.04 \n"
sudo apt-get -y install postgresql-common
sudo apt-get -y install postgresql-9.3 libpq-dev

######## Some things for Desktop only
echo "\n Ubuntu desktop stuff unattended \n"
sudo apt-get -y install ubuntu-restricted-extras vlc google-chrome-stable libreoffice libreoffice-core libreoffice-base sublime-text vlc nautilus-dropbox skype virtualbox

######## Some things that require user interaction
echo "\n Stay close, these things mibht be asking you some questions to answer \n"
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo "\n Ubuntu Desktop stuff that needs you to choose config options to finish installing \n"
# sudo apt-get -y install

if [ ! -f ".ssh/id_rsa.pub" ]; then
  ssh-keygen -t rsa -C "dewet@blomerus.org"
fi

sudo apt-get -y autoremove
