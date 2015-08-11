#!/bin/bash

## Use $2 instead of running scutil
dsconfigad -add "$4" -username "$5" -password "$6" -computer "`scutil --get ComputerName`" -mobile enable -mobileconfirm disable -localhome enable -useuncpath disable -shell /bin/bash -ou "$7" -groups "$8" -force >/dev/null 2>&1

exit 0
