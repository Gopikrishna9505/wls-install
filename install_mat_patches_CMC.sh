#!/bin/ksh


# install_mat_patches.sh
#
# - this uses the combined role 'mat_patches' which performs shutdown, patch install or rollback, and startup
#   the rollback variable is set in group_vars/all file
#   the patch file names, patch id, etc also set in group_vars/all

#
# needs parameters(?) to select the inventory file and/or limited host ( inventory should use standard names dev1, qa1, uat1, prod1, etc. )
#


#
# fetch patch files from repository onto ansible controller

echo "Retrieve patch files"
ansible-playbook fetch_patches.yaml -i cmc_inventory.yaml --ask-pass

#
# push patch files from ansible controller to weblogic inventory hosts

echo "Copying patch files to target hosts and extracting"
ansible-playbook extract_patches.yaml -i cmc_inventory.yaml -l dev1, --ask-pass

#
# execute patch tasks on weblogic inventory hosts

echo "Patching servers with mat_patches role"
ansible-playbook mat_patches.yaml -i cmc_inventory.yaml -l dev1, --ask-pass


 
