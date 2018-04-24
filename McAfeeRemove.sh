#!/bin/bash
#/usr/local/McAfee/uninstall EPM

launchctl unload -w /Library/LaunchDaemons/com.mcafee.ssm.Eupdate.plist
launchctl unload -w /Library/LaunchDaemons/com.mcafee.ssm.ScanFactory.plist
launchctl unload -w /Library/LaunchDaemons/com.mcafee.ssm.ScanManager.plist
launchctl unload -w /Library/LaunchDaemons/com.mcafee.virusscan.fmpd.plist
launchctl unload -w /Library/LaunchAgents/com.mcafee.menulet.plist
launchctl unload -w /Library/LaunchAgents/com.mcafee.reporter.plist

rm -rf /Library/LaunchAgents/com.mcafee.*
rm -rf /Library/LaunchDaemons/com.mcafee.*
rm -rf /Applications/McAfee\ Endpoint\ Protection\ for\ Mac.app
rm -rf /Applications/McAfee\ Endpoint\ Security\ for\ Mac.app
rm -rf /usr/local/McAfee
rm -rf /Library/McAfee
rm -rf /Library/Application\ Support/McAfee
rm -rf /Library/.McAfee
rm -rf /var/McAfee
rm -rf /etc/McAfee*
rm -rf /var/db/receipts/com.mcafee.*
rm -rf /etc/cma.d
rm -rf /etc/cma.conf
rm -rf /etc/ma.d
rm -rf /Library/Preferences/com.mcafee.ssm.*
rm -rf /Library/StartupItems/cma
