#!/bin/bash

FILE_NAME=$(basename "$0")
STAGE="${FILE_NAME%.*}"

ansible-playbook config/ansible/playbook.yml -vv \
    -l ${STAGE} \
    -e stage=${STAGE} \
    -e version=${BUILD_ID}
