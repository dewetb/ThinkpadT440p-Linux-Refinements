#Add this script to the Startup Applications in Ubuntu
#"xinput list" to find the id of the touchpad
#"xinput list-props 11" shows what the current properties for that device is
#My TouchPad gets 2 different ID's depending on if I am docked or not

xinput set-prop 11 "Synaptics Palm Detection" 1

xinput set-prop 11 "Synaptics Palm Dimensions" 10, 10

xinput set-prop 14 "Synaptics Palm Detection" 1

xinput set-prop 14 "Synaptics Palm Dimensions" 10, 10

#Fixing palm detection http://stevenkohlmeyer.com/fixing-palm-detect-ubuntu-14-04/