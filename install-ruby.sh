######## Install Ruby & Rails

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

