#!/bin/sh
LoggedInUser=$(stat -f%Su /dev/console)
sudo -u $LoggedInUser defaults write com.microsoft.autoupdate2 HowToCheck AutomaticDownload