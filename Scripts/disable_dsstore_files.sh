#!/bin/sh

for USER_TEMPLATE in "/System/Library/User Template"/*
        do
        /usr/bin/defaults write "${USER_TEMPLATE}"/Library/Preferences/.GlobalPreferences DSDontWriteNetworkStores -bool TRUE
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
                        killall -u $USER_UID cfprefsd
                        /usr/bin/defaults write "${USER_HOME}/Library/Preferences/.GlobalPreferences" DSDontWriteNetworkStores -boolean TRUE
                        fi
                fi
done

exit 0
