#!/bin/ksh


# install_jdk.sh
#
#

#
# fetch patch files from repository onto ansible controller

echo "Retrieve patch files"
ansible-playbook fetch_java.yaml -i cme_inventory.yaml  --ask-pass

#
# push patch files from ansible controller to weblogic inventory hosts

echo "copying jdk installation files to target hosts and extracting"
ansible-playbook extract_java.yaml -i cme_inventory.yaml -l uat1, --ask-pass



 
