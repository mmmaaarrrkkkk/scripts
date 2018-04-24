#!/bin/bash
# This script will check to see if Microsoft AutoUpdate is set to automatically download and install updates.
CHECK=`defaults read  com.microsoft.autoupdate2 HowToCheck`
if [ "$CHECK" == "AutomaticDownload" ]; then
   echo "<result>compliant</result>"
else
   echo "<result>noncompliant</result>"
fi