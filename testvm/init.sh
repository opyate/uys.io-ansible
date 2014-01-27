#!/bin/bash

ADMINUSER=r00t

ret=false
getent passwd $ADMINUSER >/dev/null 2>&1 && ret=true

if $ret; then
  echo "$ADMINUSER user exists"
else
  useradd -p $ADMINUSER -s /bin/bash -m -g admin $ADMINUSER
  tar xzf /vagrant/ssh.tgz -C /home/$ADMINUSER
  chown -R $ADMINUSER:admin /home/$ADMINUSER/.ssh
  chmod 700 /home/$ADMINUSER/.ssh
  chmod 600 /home/$ADMINUSER/.ssh/authorized_keys
  cp /vagrant/$ADMINUSER-sudoers /etc/sudoers.d/$ADMINUSER
fi

