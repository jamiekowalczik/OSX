#!/bin/sh

SUBMIT_TO_APPLE=NO
SUBMIT_TO_APP_DEVELOPERS=NO

PLBUDDY=/usr/libexec/PlistBuddy
osvers=$(sw_vers -productVersion | awk -F. '{print $2}')

if [ $osvers -ge 10 ]; then
        CRASHREPORTER_SUPPORT="/Library/Application Support/CrashReporter"
        CRASHREPORTER_DIAG_PLIST="${CRASHREPORTER_SUPPORT}/DiagnosticMessagesHistory.plist"

        if [ ! -d "${CRASHREPORTER_SUPPORT}" ]; then
                mkdir "${CRASHREPORTER_SUPPORT}"
                chmod 775 "${CRASHREPORTER_SUPPORT}"
                chown root:admin "${CRASHREPORTER_SUPPORT}"
        fi

        for key in AutoSubmit AutoSubmitVersion ThirdPartyDataSubmit ThirdPartyDataSubmitVersion
        do
                $PLBUDDY -c "Delete :$key" "${CRASHREPORTER_DIAG_PLIST}" 2> /dev/null
        done

        $PLBUDDY -c "Add :AutoSubmit bool ${SUBMIT_TO_APPLE}" "${CRASHREPORTER_DIAG_PLIST}"
        $PLBUDDY -c "Add :AutoSubmitVersion integer 4" "${CRASHREPORTER_DIAG_PLIST}"
        $PLBUDDY -c "Add :ThirdPartyDataSubmit bool ${SUBMIT_TO_APP_DEVELOPERS}" "${CRASHREPORTER_DIAG_PLIST}"
        $PLBUDDY -c "Add :ThirdPartyDataSubmitVersion integer 4" "${CRASHREPORTER_DIAG_PLIST}"
fi

exit 0
