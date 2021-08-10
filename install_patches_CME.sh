#!/bin/ksh


# install_patches.sh
#
# needs parameters(?) to select the host ( inventory should have standard names dev1, dev1, qa1, qa2, etc. )
#


#
# fetch patch files from repository onto ansible controller

echo "Retrieve patch files"
ansible-playbook stage_patches.yaml -i cme_inventory.yaml --ask-pass

#
# push patch files from ansible controller to weblogic hosts

echo "Copying patch files to target hosts and extracting"
ansible-playbook extract_patches.yaml -i cme_inventory.yaml -l dev1, --ask-pass

#
# stop servers on the weblogic host

echo "Stopping servers with mat_stop..."
ansible-playbook mat_stop.yaml -i cme_inventory.yaml -l dev1, --ask-pass

#
# install patch(es)

#  echo "Installing patch(es)"
ansible-playbook apply_opatch.yaml -i cme_inventory.yaml -l dev1, --ask-pass


#
# rollback patch(es)

  echo "Rolling back patch(es): "
  ansible-playbook rollback_opatch.yaml -i cme_inventory.yaml -l dev1 --ask-pass


#
# start servers on the weblogic host


  echo "Starting servers with mat_start"
  ansible-playbook mat_start.yaml -i cme_inventory.yaml -l dev1, --ask-pass


 
