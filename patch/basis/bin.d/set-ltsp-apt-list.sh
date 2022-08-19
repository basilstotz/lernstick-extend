#!/bin/sh

if grep -q Debian /etc/issue;then
       curl -s -o /etc/apt/sources.list.d/ltsp-ubuntu-ppa-focal.list https://ltsp.org/misc/ltsp-ubuntu-ppa-focal.list
       curl -s -o /etc/apt/trusted.gpg.d/ltsp_ubuntu_ppa.gpg https://ltsp.org/misc/ltsp_ubuntu_ppa.gpg
else
       add-apt-repository --yes ppa:ltsp
fi

exit
