#!/bin/sh

echo "configure.sh is running..."
export ANSIBLE_ROLES_PATH=/apps/ansible/roles

echo "installing playbook dependencies..."
ansible-galaxy install -r /apps/ansible/playbook/requirements.yml

echo "running playbook"
ansible-playbook /apps/ansible/playbook/test_play.yml