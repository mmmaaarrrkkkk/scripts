#!/bin/sh
# This script will check to see if the machine has had a kernel panic in the last 7 days.
PanicLogCount=$(find /Library/Logs/DiagnosticReports -Btime -7 -name *.panic | awk 'END{print NR}')
if [ "$PanicLogCount" == "0" ]; then
   echo "<result>compliant</result>"
else
   echo "<result>noncompliant</result>
fi
