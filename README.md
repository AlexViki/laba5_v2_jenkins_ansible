# Run Freestyle project via Jenkins

### TASK:
- Create new instants via Freestyle project in Jenkins using Ansible;
- Install NGINX, Jenkins to instants via Ansible;
- Set basic auth authorization to WEB-server (NGINX);

### EXPECTED RESULT:
You have to have a pipeline that runs from a local machine and as a result you have to get a virtual machine with Jenkins through the base authorization in NGINX or Apache.

--------------------------------------------------------------------------------------

You need to copy text from "run_all.sh" and put it to Freestyle project in block "Build/Execute shell" Jenkins  
script will install all necessary package for running "Ansible" file
use Azure service principal for authorization "az ad sp create-for-rbac --name AnsibleService" before running this script
create variables in jenkins: "url" "pass" "tenant" and and insert to these variables your result from "Azure service principal"

# How to setup "pipline"

1. Crete new "pipline"
2. Check the box "GitHub project" and insert you URL of GitHub "https://github.com/AlexViki/laba5_v2_jenkins_ansible.git/"
3. Check the box "GitHub hook trigger for GITScm polling"
4. In "Pipeline" block choose "Definition" -> "Pipeline script from SCM"; "SCM" -> "GIT"; "Repository URL" -> "git@github.com:AlexViki/laba5_v2_jenkins_ansible.git"; "Credentials" -> "YOUR KEY TO GITHUB"; "Script Path" -> "jenkinsfiles/main.jenkins"
