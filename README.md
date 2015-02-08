Tweaks for running Ubuntu 14.04 on a Thinkpad T440p. If any of this helps you on a different laptop, great, but I'm just trying to get my own laptop working and sharing my progress.

I set out to buy a laptop to run Linux and do programming, after lots of research I decided on a Thinkpad T440p because it has tons of single threaded performance, excellent keyboard, good driver support for Linux and can be ordered with a very sharp 1080p monitor. As I was upgrading from a Macbook Pro I was hoping for everything to "Just Work" and it did......... some things just didn't work very nicely, here is my progress in trying to tweak them to excellence.

The /etc/rc.local file runs at boot. I added 3 lines to fix 3 things.

#Bluetooth was on at boot, this turns it off. Use sudo rfkill unblock bluetooth to turn it on
rfkill block bluetooth

#Brightness skipped steps so there were only a few brightness levels
echo N | sudo tee /sys/module/video/parameters/brightness_switch_enabled

#Disable tap to click while typing
syndaemon -i 4 -d -t -K

#Strip out a lot of the extra crap that the Dash tries to search through
#This shows all the installed lenses & Scopes.

dpkg -l | egrep "(unity-lens-|unity-scope-)"

#I have a shell script that uninstalls all of the ones that are not needed, it’s saved in ~/scripts

#Installed a newer kernel to fix the brighness getting stuck after removing from dock, it worked.

In order to make the currnet tab more visible in terminal. I put the following CSS in ~/.config/gtk-3.0/gtk.css

TerminalWindow .notebook tab:active {
    background-color: #9CD;
}

#Fixing palm detection http://stevenkohlmeyer.com/fixing-palm-detect-ubuntu-14-04/