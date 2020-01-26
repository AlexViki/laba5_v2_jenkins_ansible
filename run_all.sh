#!/bin/bash

URL=`cat /home/alex/secret/url`
PASS=`cat /home/alex/secret/pass`
TENANT=`cat /home/alex/secret/tenant`

FULLPATH=`pwd`

echo "-------------START----> BUILD----> | $BUILD_DISPLAY_NAME |"
echo ""
echo "                Generate NEW SSH key                       "
echo "###########################################################"

sudo ssh-keygen -t rsa -N "" -f ~/.ssh/laba5_jenkins_to_ansible_to_azure <<< y
sudo chmod 600 ~/.ssh/laba5*

echo ""
echo "                 Install Azure CLI                         "
echo "###########################################################"

sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo ""
echo "                Authorization to Azure                     "
echo "###########################################################"

az login --service-principal -u $URL -p $PASS --tenant $TENANT

echo ""
echo "     Installnstall ansible and ansible Azure module        "
echo "###########################################################"

sudo apt-get update
sudo apt-get install -y libssl-dev libffi-dev python-dev python-pip
sudo pip install ansible
sudo pip install ansible[azure]

echo ""
echo "                     RUN playbook                           "
echo "###########################################################"

ansible-playbook -i $FULLPATH/hosts $FULLPATH/create_vm.yml

echo "###########################################################"
echo
echo "-------------END----> BUILD----> | $BUILD_DISPLAY_NAME |"
