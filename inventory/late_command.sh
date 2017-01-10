#!/bin/sh

# This script setups ansible and runs it
# It should be ran at the end of the basic installation of a machine

apt install -y ansible git eatmydata

# We clone our ansible repository and copy the ansible config files

git clone https://anonscm.debian.org/git/debconf-video/ansible.git /root/debconf-ansible
git clone https://github.com/xfxf/lca2017-av.git /root/lca2017-av

# Aaaand we run ansible

eatmydata ansible-playbook --inventory-file=/root/lca2017-av/inventory/hosts \
	--connection=local \
	--limit=$(hostname) \
	/root/debconf-ansible/site.yml
