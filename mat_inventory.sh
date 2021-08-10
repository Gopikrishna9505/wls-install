#!/bin/ksh


# mat_inventory.sh
#


#
# Uses opatch to show patch inventory to validate patch installation

echo "Check current patch inventory"
ansible-playbook mat_inventory.yaml -i CPR_inventory.yaml -l dev1, --ask-pass -vvv


 
