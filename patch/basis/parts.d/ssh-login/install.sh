#!/bin/sh

sed -e "s/^.*PasswordAuthentication.*$/PasswordAuthentication yes/g" -i /etc/ssh/sshd_config

