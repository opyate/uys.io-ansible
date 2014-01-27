#!/bin/bash
# This sets up a small virtual python installation with which to manage Ansible boxes.

sudo apt-get install python-dev
sudo apt-get install python-virtualenv
# see quick tut here: http://simononsoftware.com/virtualenv-tutorial/
mkdir ansible
virtualenv ansible/manager --no-site-packages
source ansible/manager/bin/activate

cd ansible/manager

# installl yolk, with which to list packages
easy_install yolk
yolk -l

# should output only 6 packages: Python, argparse, distribute, pip, wsgiref, yolk

git clone git://github.com/ansible/ansible.git
# ansible will be sourced in post-setup.sh

# grab the 3rd party 'known hosts' library
git clone https://github.com/brycebaril/ansible-known_hosts.git library/ansible-known_hosts

# install ansible dependencies
pip install paramiko PyYAML jinja2

echo "Now source 'post-setup' to complete the process."
