#!/bin/sh

for USER_TEMPLATE in "/System/Library/User Template"/*
do
        /usr/bin/defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.driver.AppleHIDMouse Button2 -int 2
        /usr/bin/defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton
        /usr/bin/defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1
done

for USER_HOME in /Users/*
do
        USER_UID=`basename "${USER_HOME}"`
        if [ ! "${USER_UID}" = "Shared" ]
        then
                if [ ! -d "${USER_HOME}"/Library/Preferences ]
                then
                        mkdir -p "${USER_HOME}"/Library/Preferences
                        chown "${USER_UID}" "${USER_HOME}"/Library
                        chown "${USER_UID}" "${USER_HOME}"/Library/Preferences
                fi
                if [ -d "${USER_HOME}"/Library/Preferences ]
                then
                        killall -u $USER_UID cfprefsd >/dev/null 2>&1
                        /usr/bin/defaults write "${USER_HOME}"/Library/Preferences/com.apple.driver.AppleHIDMouse Button2 -int 2
                        /usr/bin/defaults write "${USER_HOME}"/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton
                        /usr/bin/defaults write "${USER_HOME}"/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1
                fi
        fi
done

exit 0
