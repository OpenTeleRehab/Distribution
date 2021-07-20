#!/bin/bash

echo "* Cloning HIV repositories"
git clone git@git.web-essentials.asia:hiv-tra-20/admin-service.git ../admin-service
git clone git@git.web-essentials.asia:hiv-tra-20/therapist-service.git ../therapist-service
git clone git@git.web-essentials.asia:hiv-tra-20/patient-service.git ../patient-service
git clone git@git.web-essentials.asia:hiv-tra-20/admin-web-app.git ../admin-web-app
git clone git@git.web-essentials.asia:hiv-tra-20/therapist-web-app.git ../therapist-web-app
git clone git@git.web-essentials.asia:hiv-tra-20/keycloak.git ../keycloak
git clone git@git.web-essentials.asia:hiv-tra-20/krakend.git ../krakend
git clone git@git.web-essentials.asia:hiv-tra-20/hic-service.git ../open-library-service
git clone git@git.web-essentials.asia:hiv-tra-20/hic-webapp.git ../open-library-web-app

echo "* Run composer to install dependencies"
composer install --prefer-dist -vvv -d ../admin-service || exit -1
composer install --prefer-dist -vvv -d ../therapist-service || exit -1
composer install --prefer-dist -vvv -d ../open-library-service || exit -1

echo "* Run install NPM package dependencies"
yarn --cwd ../admin-web-app
yarn --cwd ../therapist-web-app
yarn --cwd ../open-library-web-app

echo "* Up docker with docker-compose"
docker-compose build
docker-compose up -d

if [ $? -eq 0 ]; then
    echo " ==> Docker is up and running"
else
    sudo sh -c ''
  kill $(sudo lsof -t -i:80)
  echo " ==> Re-run command up docker"
  ./local_setup/setup.sh || exit -1
fi

echo "* Add host to /etc/hosts"
hostname="local-rehabilitation.wehost.asia test.local-rehabilitation.wehost.asia"
admin_hostname="local-admin-rehabilitation.wehost.asia test.local-admin-rehabilitation.wehost.asia"
open_library_hostname="local-library-opentelerahab.wehost.asia test.library-opentelerahab.wehost.asia"
count=$(grep -o "$hostname" /etc/hosts | wc -l)
if [ $count != 0 ];then
    echo "==> Skip: host already existed."
else
    sudo bash -c "echo 0.0.0.0 ${hostname} ${admin_hostname} ${open_library_hostname} >> /etc/hosts"
fi

echo "*** DONE ***"
