#!/bin/bash

sudo rm -rf .terraform/ terraform.tfstate terraform.tfstate.backup .terraform.lock.hcl
sudo terraform init

sudo terraform apply --auto-approve


ip=`terraform output -raw PublicIP`
pass=`terraform output -json password | jq -r '.[0]'`

echo "deploy_user ansible_host=${ip} ansible_ssh_pass=\"${pass}\" ansible_user=root ansible_port=22" > ./ansible_adduser/iplist.txt

sudo ansible-playbook -i ./Ansible_addUser/iplist.txt ./Ansible_addUser/main.yml
