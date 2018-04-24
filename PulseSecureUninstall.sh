#!/bin/sh
####################################################################
# Kill off older, possibly corrupt installations of Junos Pulse or Pulse Secure
# NOTE: This should NOT be run unless user is experiencing issues
# with the Junos SSLVPN software already.  This is intended
# to be a clean-up ONLY and NOT a precursor to 1st install.
####################################################################
# Cobbled together from other's hard work
# By Christopher Miller for ITSD-ISS of JHU-APL
# Dated:  2015-02-18, Updated: 2016-02-14
####################################################################

# Look for a Junos Pulse or Pulse Secure installation
if [ -e "/Applications/Junos Pulse.app/" ]
    then
    echo "Found Junos Pulse, now removing"
    /bin/sh '/Library/Application Support/Juniper Networks/Junos Pulse/Uninstall.app/Contents/Resources/uninstall.sh'
    sleep 5

elif [ -e "/Applications/Pulse Secure.app/" ]
    then
    echo "Found Pulse Secure, now removing"
    /bin/sh '/Library/Application Support/Pulse Secure/Pulse/Uninstall.app/Contents/Resources/uninstall.sh'
    sleep 5

else 
    echo "SSL-VPN App not Found"

fi

echo "Done!"
exit 0