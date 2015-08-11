#!/bin/sh

echo "$4" >/etc/ntp.conf
/usr/sbin/systemsetup -setnetworktimeserver "$4"

# Set the time zone to London
/usr/sbin/systemsetup -settimezone "$5"

# Enable network time servers
/usr/sbin/systemsetup -setusingnetworktime on

exit 0
