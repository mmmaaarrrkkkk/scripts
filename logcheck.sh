#!/bin/sh

# This script checks both newsyslog and aslmanager log files, checks the ownership and chowns the output to root.

newsyslog=$(/usr/bin/grep -v '^#' /etc/newsyslog.conf | awk '{ print $1 }')
for i in ${newsyslog[@]}; do
    chown root:wheel $i > /dev/null 2>&1
done

