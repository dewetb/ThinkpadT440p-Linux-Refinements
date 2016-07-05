######## Install Ruby & Rails

rbenv install 2.3.1
rbenv global 2.3.1
ruby -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

gem install rails

rbenv rehash

rails -v

