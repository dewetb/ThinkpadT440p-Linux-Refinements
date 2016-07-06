# Install everything needed to set up an Ubuntu laptop or vm for web development
echo "\n First I'll try to install everything that you can walk away for \n"

######## Initial Update & Upgrade

sudo apt-get -y update
sudo apt-get -y dist-upgrade

######## apt-get install Everything that don't need additional software sources added
echo "\n Install vim & zsh & other basics \n"
sudo apt-get -y install vim-nox zsh git-core git curl

echo  "\n Instal Ruby dependencies from https://gorails.com/setup/ubuntu/16.04 \n"
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

echo "\n Postgres from https://gorails.com/setup/ubuntu/16.04 \n"
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install postgresql-common postgresql-9.5 libpq-dev

echo "\n Servers, databases & other misc web development stuff \n"
sudo apt-get -y install silversearcher-ag redis-server nginx apache2-utils phantomjs traceroute graphicsmagick python-pip mysql-client libmysqlclient-dev

######## Install things with clone, curl or wget
cd

if [ ! -d ".oh-my-zsh" ]; then
  sudo curl -L http://install.ohmyz.sh | sh
  chsh -s `which zsh`
fi

# Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  cd ~/.vim/bundle/Vundle.vim && git pull
  cd -
fi

######## Install Ruby & Rails Dependencies

if [ ! -d ".rbenv" ]; then
  git clone git://github.com/sstephenson/rbenv.git .rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc

  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc

  git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
fi

###### Configure Git
echo "\n Configuring Git \n"
git config --global color.ui true
git config --global user.name "De Wet"
git config --global user.email "dewet@blomerus.org"
git config --global push.default simple
git config --global core.editor "vim"

######## Some things that require user interaction
echo "\n Stay close, these things mibht be asking you some questions to answer \n"
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

if [ ! -f ".ssh/id_rsa.pub" ]; then
  ssh-keygen -t rsa -C "dewet@blomerus.org"
fi
echo '--color' >> ~/.rspec

sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y purge
sudo reboot
