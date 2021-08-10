#!/bin/ksh

#echo "Enter ssh user:"
#read -s ssh_user

3echo "Enter ssh password for $ssh_user:"
#stty -echo
#read -s ssh_pass
#stty echo


ansible-playbook connect.yaml -i inventories/CPR/CPR_inventory.yaml --ask-pass 
# ansible-playbook mat_status.yaml -i CPR_inventory.yaml -e "ansible_ssh_user=$ssh_user ansible_ssh_pass=$ssh_pass" 
