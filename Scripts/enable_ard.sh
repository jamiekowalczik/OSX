#!/bin/sh
ARD="/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart"

# Switch on Apple Remote Desktop
$ARD -configure -activate

# Configure ARD access for the localadmin user
$ARD -configure -access -on
$ARD -configure -allowAccessFor -specifiedUsers
$ARD -configure -access -on -users localadmin -privs -all

exit 0
