#!/bin/bash

exit 0
FILE_NAME=$(basename "$0")
STAGE="${FILE_NAME%.*}"

ansible-playbook config/ansible/playbook.yml -t deploy \
    -l ${STAGE} \
    -e stage=${STAGE} \
    -e version=${DEPLOY_ID}
