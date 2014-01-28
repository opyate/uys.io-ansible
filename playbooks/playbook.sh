#!/bin/bash
# Author: Juan M Uys <opyate@gmail.com>

# the runmode is the same as the first part of symbolic link name
INIT=$(basename $0)
WHICH=$1

# check that we don't run the playbook.sh script directly
if [ "$INIT" == "playbook.sh" ]; then
  echo "Run with one of the symlinks instead:"
  find . -maxdepth 1 -type l
  exit 1
fi

# we need an argument: the directory which contains the playbooks
if [ "x$WHICH" == "x" ] ; then
  echo "Argument required: the directory which contains the playbooks"
  exit 2
fi

if [ "x$INIT" == "xdev" ] ; then
  export MANAGER_USER=r00t
  export MANAGER_KEY=../testvm/r00t
else
  export MANAGER_USER=ubuntu
  export MANAGER_KEY=~/.ssh/opyate-aws-sandboxes.pem
fi

ansible-playbook $WHICH/${INIT}.yml -i ${INIT}_hosts -u $MANAGER_USER --private-key=$MANAGER_KEY  --sudo -vvvv --extra-vars "@/home/opyate/.ansible/eyes-only.yml"
