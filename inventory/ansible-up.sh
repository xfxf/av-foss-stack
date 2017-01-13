#!/bin/sh

set -euf

(cd ansible; git pull)
(cd lca2017-av; git pull)

exec ansible-playbook --inventory-file=/root/lca2017-av/inventory/hosts \
	--connection=local \
	--limit=$(hostname) \
	/root/debconf-ansible/site.yml
