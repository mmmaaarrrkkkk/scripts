#!/bin/bash -v

#kill Citrix Receiver if running
pkill Citrix Receiver

#get loggedinuser
loggedInUser="$(/bin/ls -la /dev/console | /usr/bin/cut -d " " -f 4)"

#confirm plist exists
if [ ! -f /Users/"$loggedInUser"/Library/Preferences/com.citrix.receiver.nomas.plist ]
then
  echo "Plist not found, Citrix not installed or in error."
  exit 1
else
  echo "Plist exists, continuing..."
fi

plistContents="$(defaults read /Users/"$loggedInUser"/Library/Preferences/com.citrix.receiver.nomas)"
autoUpdateSetting="$(defaults read /Users/"$loggedInUser"/Library/Preferences/com.citrix.receiver.nomas AutoUpdateState)"

if [[ "$plistContents" == *"AutoUpdateState"* ]] #autoupdatesetting exists
then
  if [[ $autoUpdateSetting != "Disabled" ]] #autoupdatesetting is not set to Disabled
  then
    su -l $loggedInUser -c "defaults write com.citrix.receiver.nomas AutoUpdateState -string Disabled"
    autoUpdateSetting="$(defaults read /Users/"$loggedInUser"/Library/Preferences/com.citrix.receiver.nomas AutoUpdateState)"
    echo "${autoUpdateSetting} set"
  else
    echo "${autoUpdateSetting} already set"
  fi
else
  su -l $loggedInUser -c "defaults write com.citrix.receiver.nomas AutoUpdateState -string Disabled"
  autoUpdateSetting="$(defaults read /Users/"$loggedInUser"/Library/Preferences/com.citrix.receiver.nomas AutoUpdateState)"
  echo "${autoUpdateSetting} set"
fi

exit 0