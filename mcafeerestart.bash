#!/bin/bash

launchctl load -w /Library/LaunchDaemons/com.mcafee.virusscan.fmpd.plist
launchctl load -w /Library/LaunchDaemons/com.mcafee.ssm.ScanManager.plist
launchctl load -w /Library/LaunchDaemons/com.mcafee.ssm.ScanFactory.plist
launchctl load -w /Library/LaunchDaemons/com.mcafee.ssm.Eupdate.plist
