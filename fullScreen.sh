#!/bin/bash
 
PATH=$PATH:/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS
 
# Run a fullscreen jamfHelper window and put it into the background
jamfHelper -windowType fs -heading "This is a Full Screen Window" -description "Please wait 30 seconds" &
PID=$!      # Get the pid of the jamfHelper command
sleep 30
kill $PID
