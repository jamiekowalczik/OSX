#!/bin/sh

osvers=$(sw_vers -productVersion | awk -F. '{print $2}')
sw_vers=$(sw_vers -productVersion)

for USER_TEMPLATE in "/System/Library/User Template"/*
do
        /usr/bin/defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.SetupAssistant DidSeeCloudSetup -bool TRUE
        /usr/bin/defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.SetupAssistant GestureMovieSeen none
        /usr/bin/defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.SetupAssistant LastSeenCloudProductVersion "${sw_vers}"
        /usr/bin/defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.SetupAssistant LastSeenBuddyBuildVersion "${sw_build}"
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
                        /usr/bin/defaults write "${USER_HOME}"/Library/Preferences/com.apple.SetupAssistant DidSeeCloudSetup -bool TRUE
                        /usr/bin/defaults write "${USER_HOME}"/Library/Preferences/com.apple.SetupAssistant GestureMovieSeen none
                        /usr/bin/defaults write "${USER_HOME}"/Library/Preferences/com.apple.SetupAssistant LastSeenCloudProductVersion "${sw_vers}"
                        /usr/bin/defaults write "${USER_HOME}"/Library/Preferences/com.apple.SetupAssistant LastSeenBuddyBuildVersion "${sw_build}"
                        chown "${USER_UID}" "${USER_HOME}"/Library/Preferences/com.apple.SetupAssistant.plist
                fi
        fi
done

exit 0
