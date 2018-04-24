#!/bin/sh

userID=`dscl . -read /private/var/filevaultuser UniqueID | awk '{print $2}'`

if [ $userID -gt "500" ];then
dscl . -change /private/var/filevaultuser UniqueID $userID 101
chown -R filevaultuser /private/var/filevaultuser
defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool YES
else
echo "UniqueID is below 500"
fi
