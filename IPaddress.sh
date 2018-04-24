#!/bin/bash

CurrentIP=$(ipconfig getifaddr $(/usr/sbin/netstat -rn -f inet | awk '/default/{print $NF; exit}'ipaddr))

/usr/bin/osascript <<EOF
set myIPAddress to do shell script "echo $CurrentIP"
tell app "System Events"
activate
display dialog "IP Address Details: " & myIPAddress buttons {"OK"} default button 1
end tell
EOF
