#!/bin/sh

# adminUsers=$(dscl . read /Groups/admin GroupMembership | sed 's|GroupMembership:||;s|root||' | tr -s " ")
adminUsers=("<admin accounts>")
for i in $adminUsers
    do
        dseditgroup -o edit -a "$i" -t user admin
        echo "$i demoted"
    done
