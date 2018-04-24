#!/bin/bash
version=$(/usr/local/bin/VBoxManage -v)
echo $version
var1=$(echo $version | cut -d 'r' -f 1)
echo $var1
var2=$(echo $version | cut -d 'r' -f 2)
echo $var2
file="Oracle_VM_VirtualBox_Extension_Pack-$var1-$var2.vbox-extpack"
echo $file
echo curl http://download.virtualbox.org/virtualbox/$var1/$file -o /tmp/$file
curl -L -o /tmp/$file http://download.virtualbox.org/virtualbox/$var1/$file
#sudo VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"
yes | VBoxManage extpack install /tmp/$file --replace --accept-license=56be48f923303c8cababb0bb4c478284b688ed23f16d775d729b89a2e8e5f9eb