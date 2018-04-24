#!/bin/sh

# Installs the McAfeeAgent-Sierra.sh script
cd /var/tmp/
chmod +x McAfeeAgent-Sierra.sh
./McAfeeAgent-Sierra.sh -i

# Force agent to check in to ePO server
/Library/McAfee/agent/bin/cmdagent -p

# Check for new policies and enforce
/Library/McAfee/agent/bin/cmdagent -c
/Library/McAfee/agent/bin/cmdagent -e