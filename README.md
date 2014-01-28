# Wa?

A medley of Ansible playbooks.

Currently used for uys.io, and easily adapted for other uses.

# Ansible version

Tested with version with hash 7be13faae8a3c5920fde2a2ff70705ecaade8d8c

# Howto

There exists a management server at https://redacted.uys.io/

For development, do the following:

Set up a management workstation by running the following scripts on it (tested on Ubuntu 12.0.4 LTS):

 - setup-manager.sh : Dedicate a laptop or machine to manage your remotes by running the script *setup-manager.sh* on it.
 - post-setup       : sets useful environment variables, like your private key location. Run with 'source post-setup'
 - playbooks : manage Ansible plays here, and apply with *dev.sh*, *qa.sh* or *prod.sh*

This sets up a Python virtualenv (Ansible uses Python), with the Ansible path and a couple of useful environment variables.

# The playbooks

## UYS.io

I mostly care about the playbooks I'm using for my personal website right now. They're all in ```uys.io```

## Unsorted

These are playbooks I've used before, but are mostly unused for http://uys.io

The playbook resides at `playbooks`, and contains the following roles:

* common

Common stuff for all, like Java and the unzip utility.

* mysql

A MySQL server instance. Mostly used by dev mode for local VM installations.

* play-framework

The Play! framework.

* testscript

Post-deployment testing which didn't fit well into an Ansible command, and warranted it's own scripts.

* webapp

The web app.

* webapp-config

Some web app config changes which can't be set pre-Jenkins, so it has to be set post-Jenkins (i.e. during the deployment phase).

* webapp-mysql

The web app's database baseline. Contains some dummy data. Mostly used by dev mode.


There are a few roles which aren't documented here, but they should be self-documenting or contain its own README.md

# Managed apps

I write a lot of apps. I like to showcase them too. They are, however, scattered over many disks and repositories. I've now made a point of naming them, indexing them, writing them up, etc.

Kinda like what [http://revdancatt.com/](http://revdancatt.com/) does, e.g. CAT001, etc. I'm not going to follow that exact formula, though. What I do is this:

1. I generate a UUID, or just think up a gibberish name, e.g. "snookipoos"
2. I throw the random string into a Levenshtein calculator which looks at the British dictionary on my Ubuntu workstation at ```/usr/share/dict/british-english```
3. It chooses the word which had the shortest distance, e.g. "snoopers".
4. That is my new codename. Snoopers. I'll then create new Ansible stuff using "uys_snoopers" as the identifier.

This is what we have so far...

## The list

1. boldface &mdash; A Twitter Word Source app, of which more can be found here: https://github.com/opyate/twitter-word-source
