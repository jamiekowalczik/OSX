#!/bin/sh

UUID=`ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ { split($0, line, "\""); printf("%s\n", line[4]); }'`

for USER_TEMPLATE in "/System/Library/User Template/English.lproj"
do
   echo $USER_TEMPLATE
   if [ -e "$USER_TEMPLATE/Library/Preferences/ByHost/com.apple.network.eapolcontrol."* ]; then
      /usr/libexec/PlistBuddy -c "Set :EthernetAutoConnect false" "$USER_TEMPLATE/Library/Preferences/ByHost/com.apple.network.eapolcontrol.$UUID.plist"
   else
      /bin/mkdir "$USER_TEMPLATE/Library/Preferences/ByHost"
      /usr/libexec/PlistBuddy -c "Add :EthernetAutoConnect bool" "$USER_TEMPLATE/Library/Preferences/ByHost/com.apple.network.eapolcontrol.$UUID.plist"
      /usr/libexec/PlistBuddy -c "Set :EthernetAutoConnect false" "$USER_TEMPLATE/Library/Preferences/ByHost/com.apple.network.eapolcontrol.$UUID.plist"
   fi
done

exit 0
