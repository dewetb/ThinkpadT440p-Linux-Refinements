#!/bin/bash
# Run this script or copy & paste the commands
# To speed up the Unity Dash a lot by removing unwanted stuff

# This command will show you which lenses & scopes are currently installed
dpkg -l | egrep "(unity-lens-|unity-scope-)"

sudo apt-get purge unity-lens-friends -y
sudo apt-get purge unity-lens-music -y
sudo apt-get purge unity-lens-photos -y
sudo apt-get purge unity-lens-videos -y
sudo apt-get purge unity-scope-audacious -y
sudo apt-get purge unity-scope-calculator -y
sudo apt-get purge unity-scope-chromiumbookmarks -y
sudo apt-get purge unity-scope-clementine -y
sudo apt-get purge unity-scope-colourlovers -y
sudo apt-get purge unity-scope-devhelp -y
sudo apt-get purge unity-scope-firefoxbookmarks -y
sudo apt-get purge unity-scope-gdrive -y
sudo apt-get purge unity-scope-gmusicbrowser -y
sudo apt-get purge unity-scope-gourmet -y
sudo apt-get purge unity-scope-guayadeque -y
sudo apt-get purge unity-scope-manpages -y
sudo apt-get purge unity-scope-musicstores -y
sudo apt-get purge unity-scope-musique -y
sudo apt-get purge unity-scope-openclipart -y
sudo apt-get purge unity-scope-texdoc -y
sudo apt-get purge unity-scope-tomboy -y
sudo apt-get purge unity-scope-video-remote -y
sudo apt-get purge unity-scope-virtualbox -y
sudo apt-get purge unity-scope-yelp -y
sudo apt-get purge unity-scope-zoter -y
sudo apt-get purge unity-scope-video-remote -y
sudo apt-get purge unity-scope-musicstores -y

# Run that command again to see what is left,
# Very satisfying to see the before/after
dpkg -l | egrep "(unity-lens-|unity-scope-)"