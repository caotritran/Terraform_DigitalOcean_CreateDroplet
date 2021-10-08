#!/bin/bash

rm -rf .terraform/ terraform.tfstate terraform.tfstate.backup .terraform.lock.hcl
terraform init

terraform apply --auto-approve


ip=`terraform output -raw PublicIP`
pass=`terraform output -json password | jq -r '.[0]'`

echo "deploy_user ansible_host=${ip} ansible_ssh_pass=\"${pass}\" ansible_user=root ansible_port=22" > ./Ansible_addUser/iplist.txt

ansible-playbook -i ./Ansible_addUser/iplist.txt ./Ansible_addUser/main.yml