#!/bin/sh

## TODO: script the UID
sysadminctl -addUser $4 -fullName "$5" -UID 555 -password "$6" -home /Users/$4 -admin >/dev/null 2>&1

#dscl . create "/Users/$4"
#dscl . create "/Users/$4" UserShell /bin/bash
#dscl . create "/Users/$4" RealName "$5"
#dscl . create "/Users/$4" UniqueID 555
#dscl . create "/Users/$4" PrimaryGroupID 1555
#dscl . passwd "/Users/$4" "$6"
#dscl . append /Groups/admin GroupMembership "$4"

exit 0
