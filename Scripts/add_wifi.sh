#!/bin/sh

wifiDevice=`/usr/sbin/networksetup -listallhardwareports | awk '/^Hardware Port: Wi-Fi/,/^Ethernet Address/' | head -2 | tail -1 | cut -c 9-`

# Set the SSID variable to your wireless network name
# to set the network name you want to connect to.
# Note: Wireless network name cannot contain spaces.
SSID="$4"

# If you've set the SECURITY variable to something other than NONE,
# set the password here. For example, if you are using WPA
# encryption with a password of "thedrisin", set the PASSWORD
# variable to "thedrisin" (no quotes.)
PASSWORD="$5"

# Once the running OS is determined, the settings for the specified
# wireless network are created and set as the first preferred network listed

networksetup -setairportnetwork $wifiDevice $SSID $PASSWORD
