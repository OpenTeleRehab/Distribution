#!/bin/bash

FILE_NAME=$(basename "$0")
STAGE="${FILE_NAME%.*}"

ansible-playbook config/ansible/playbook.yml -t feature -vv\
    -l ${STAGE} \
    -e stage=${STAGE} \
    -e version=${DEPLOY_ID}
