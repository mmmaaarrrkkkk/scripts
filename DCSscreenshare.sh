#!/bin/sh

currentuser=`stat -f "%Su" /dev/console`

xattr -dr com.apple.quarantine /Users/$currentuser/Downloads/screenshare.jnlp

open /Users/$currentuser/Downloads/screenshare.jnlp