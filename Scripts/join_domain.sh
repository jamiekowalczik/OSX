#!/bin/bash

## Use $2 or "`scutil --get ComputerName`" to obtain computername
if [ "$9" -gt 0 ]; then
   dsconfigad -add "$4" -username "$5" -password "$6" -computer "$2" -mobile enable -mobileconfirm disable -localhome enable -useuncpath disable -shell /bin/bash -ou "$7" -groups "$8" -force >/dev/null 2>&1
else
   dsconfigad -add "$4" -username "$5" -password "$6" -computer "$2" -localhome enable -useuncpath disable -shell /bin/bash -ou "$7" -groups "$8" -force >/dev/null 2>&1
fi

exit 0
