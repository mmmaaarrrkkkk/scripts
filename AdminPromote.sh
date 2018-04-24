#!/bin/sh

# adminUsers=$(dscl . read /Groups/admin GroupMembership | sed 's|GroupMembership:||;s|root||;s|rdteadm||;s|jamfrdte||;s|pacscan||' | tr -s " ")
adminUsers=("rdteadm" "jamfrdte" "pacscan")
for i in $adminUsers
    do
        dseditgroup -o edit -a "$i" -t user admin
        echo "$i demoted"
    done