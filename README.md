Tweaks for running Ubuntu 14.04 on a Thinkpad T440p. I hope you find this helpful on other laptops as well, but I'm just trying targeting a T440p here working and sharing my progress.

I set out to buy a laptop to run Linux and do programming, after lots of research I decided on a Thinkpad T440p because it has tons of single threaded performance, excellent keyboard, good driver support for Linux and can be ordered with a very sharp 1080p monitor. As I was upgrading from a Macbook Pro I was hoping for everything to "Just Work" and it did......... some things just didn't work very nicely, here is my progress in trying to tweak them to excellence.

Installed a newer kernel to fix the brighness getting stuck after removing from dock, it worked.

In order to make the currnet tab more visible in terminal. I put the following CSS in ~/.config/gtk-3.0/gtk.css

TerminalWindow .notebook tab:active {
    background-color: #9CD;
}

#Fixing palm detection http://stevenkohlmeyer.com/fixing-palm-detect-ubuntu-14-04/