#!/bin/bash

# This script will attempt to start the Mcafee agent if it is not running and then collect and send props.

# first unload the mcafee agent daemons in case they're running and just stuck.
/bin/launchctl unload /Library/LaunchDaemons/com.mcafee.agent.macompat.plist
/bin/launchctl unload /Library/LaunchDaemons/com.mcafee.agent.macmn.plist
/bin/launchctl unload /Library/LaunchDaemons/com.mcafee.agent.ma.plist

# then start them back up and set them to start at boot.
/bin/launchctl load -w /Library/LaunchDaemons/com.mcafee.agent.ma.plist
/bin/launchctl load -w /Library/LaunchDaemons/com.mcafee.agent.macmn.plist
/bin/launchctl load -w /Library/LaunchDaemons/com.mcafee.agent.macompat.plist

# then run a collect and send props to make sure it worked.
/Library/McAfee/cma/bin/cmdagent -p