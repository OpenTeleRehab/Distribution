#!/bin/bash

echo "* User User own of the current directory"
sudo chown -R ${USER}:${USER} .

echo "* Copy SSL certificate"
curl -o config/docker/ssl/fullchain.pem https://packages.web-essentials.asia/boxes/devssl/wehost.asia/fullchain.pem
curl -o config/docker/ssl/privkey.pem https://packages.web-essentials.asia/boxes/devssl/wehost.asia/privkey.pem

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
git clone git@git.web-essentials.asia:hiv-tra-20/phone-service.git ../phone-service

echo "* Copy .evn"
cp ../admin-service/.env.example ../admin-service/.env
cp ../therapist-service/.env.example ../therapist-service/.env
cp ../patient-service/.env.example ../patient-service/.env
cp ../phone-service/.env.example ../phone-service/.env
cp ../open-library-service/.env.example ../open-library-service/.env

echo "* Run composer to install dependencies"
docker-compose run --no-deps admin_service composer install --prefer-dist -vvv
docker-compose run --no-deps therapist_service composer install --prefer-dist -vvv
docker-compose run --no-deps patient_service composer install --prefer-dist -vvv
docker-compose run --no-deps phone_service composer install --prefer-dist -vvv
docker-compose run --no-deps library_service composer install --prefer-dist -vvv

echo "* Run install NPM package dependencies"
docker-compose run --no-deps admin_web_app yarn --frozen-lockfile
docker-compose run --no-deps therapist_web_app yarn --frozen-lockfile
docker-compose run --no-deps library_web_app yarn --frozen-lockfile

echo "* Up docker with docker-compose"
docker-compose up -d

if [ $? -eq 0 ]; then
    echo " ==> Docker is up and running"
else
    sudo sh -c ''
  kill $(sudo lsof -t -i:80)
  echo " ==> Re-run command up docker"
  ./local_setup/setup.sh || exit -1
fi

echo "* Restore Rocket chat DB"
docker-compose exec -T mongo mongorestore --archive < ./config/mongo/rocketchat_dump.gz

echo "* Add host to /etc/hosts"
admin_hostname="local-hi-admin.wehost.asia test.local-hi-admin.wehost.asia"
therapist_hostname="local-hi-therapist.wehost.asia test.local-hi-therapist.wehost.asia"
chat_hostname="local-hi-chat.wehost.asia"
open_library_hostname="local-hi-library.wehost.asia test.local-hi-library.wehost.asia"
none_hi="local-nonhi-admin.wehost.asia local-nonhi-therapist.wehost.asia local-nonhi-patient.wehost.asia"
count=$(grep -o "$admin_hostname" /etc/hosts | wc -l)
if [ $count != 0 ];then
    echo "==> Skip: host already existed."
else
    sudo bash -c "echo 0.0.0.0 ${admin_hostname} ${therapist_hostname} ${chat_hostname} ${open_library_hostname} ${none_hi} >> /etc/hosts"
fi

echo "*** DONE ***"
