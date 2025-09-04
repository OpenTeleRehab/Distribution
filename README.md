# Overview

This repository is where OpenRehab App implemented in Microservices and using docker-compose and single sign on with keycloak.

# Maintainer

* Web Essentials Co., Ltd

# Required Dependencies

* [Git](https://git-scm.com/) version >= 2.0.0
* [Docker](https://docs.docker.com/install/) version >= 17.12.0
* [docker-compose](https://docs.docker.com/compose/install/#install-compose) >= 1.12.0

# Local environment with Docker

## Clone project to your development workspace

    ```bash
    git clone git@git.web-essentials.asia:hiv-tra-20/Distribution.git ~/dev/docker-projects/hiv/distribution
    ```

  OR from public github repo ```master``` branch

    ```bash
    git clone git@github.com:OpenTeleRehab/Distribution.git ~/dev/docker-projects/hiv/distribution
    ```

## Navigate to your project

    cd ~/dev/docker-projects/hiv/distribution

## Using ```make help``` to show all setup command*

    make help

## Using ```make setup ``` to Setup project

    make setup

  OR with public repo

    make setup GIT_HOST=git@github.com:OpenTeleRehab

## Verify installation by visiting site below:
  * [Admin Portal](https://local-hi-admin.wehost.asia) with user access below:
    * super-admin@we.co / Xr<6U15i3[
    * organization-admin@we.co / X!*7z-J(km
    * country-admin@we.co / 1;f:W2vraO
    * clinic-admin@we.co / 00C{s#+3Sh
  * [Therapist Portal](https://local-hi-therapist.wehost.asia) with user access below:
    * therapist@we.co / m>Hd2fn<ws
  * [Library Portal](https://local-hi-library.wehost.asia) with user access below:
    * library@we.co / Library@Portal
  * [Rocket Chat](https://local-hi-chat.wehost.asia) with user access below:
    * admin / H1V-CHAT@ADM1N
  * [Keycloak](https://local-hi-admin.wehost.asia/auth) with user access below:
    * admin / j}kFTdp=jE&YUJe3

## How to backup databases
  * Backup mysql database ```keycloak_db, admin_service_db, therapist_service_db, patient_service_db, vn_patient_service_db, phone_service_db, open_library_service_db```
    ```bash
    docker-compose exec -T keycloak_db /usr/bin/mysqldump -uroot -proot keycloak | gzip -9 > kc_db_dump.sql.gz
    ```

  * Backup Mongo database rocketchate
    ```bash
    docker-compose exec -T mongo mongodump --archive > mongo_db_dump.gz
    ```

  > Access database via user interface: [http://localhost:8060/](http://localhost:8060/)

  > Access mailbox testing tool: [http://localhost:8025/](http://localhost:8025/)

### Enjoy your development on `admin-web-app` or `therapist-web-app`

# Setup apache superset

  ```bash
  make
  make docker-net
  make superset
  ```

# Setup Trino

  ```bash
  make
  make docker-net
  make trino
  ```

## Trino configuration files

  ```bash
  ./config/docker/trino/etc
  ```

# Useful docker command

* Manually up docker

    ```bash
    docker-compose up -d
    ```

* Manually kill running docker

    ```bash
    docker-compose kill
    ```

### Common Issues
* Invalid ssl certificate
  * Download [fullchain.pem](https://packages.web-essentials.asia/boxes/devssl/wehost.asia/fullchain.pem), [privkey.pem](https://packages.web-essentials.asia/boxes/devssl/wehost.asia/privkey.pem) files, and replace them into `./config/docker/ssl/`. Then please restart the docker containers.

  ```bash
  curl -o config/docker/ssl/fullchain.pem https://packages.web-essentials.asia/boxes/devssl/wehost.asia/fullchain.pem
  curl -o config/docker/ssl/privkey.pem https://packages.web-essentials.asia/boxes/devssl/wehost.asia/privkey.pem
  ```
