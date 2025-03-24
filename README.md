# Overview

This repository is where OpenTeleRehab is implemented in Microservices and using docker-compose and single sign on with keycloak.

# Maintainer

* Web Essentials Co., Ltd

# Required Dependencies

* [Git](https://git-scm.com/) version >= 2.0.0
* [Docker](https://docs.docker.com/install/) version >= 17.12.0
* [docker-compose](https://docs.docker.com/compose/install/#install-compose) >= 1.12.0

# Local environment with Docker

## Clone project to your development workspace

    git clone git@git.web-essentials.asia:hiv-tra-20/Distribution.git ~/dev/docker-projects/hiv/distribution


## Navigate to your project

    cd ~/dev/docker-projects/hiv/distribution

## Using make to setup*

    make help

## Get Backup databases from developer

    ./config/db_dump/kc_db_dump.sql.gz
    ./config/db_dump/admin_db_dump.sql.gz
    ./config/db_dump/therapist_db_dump.sql.gz
    ./config/db_dump/patient_db_dump.sql.gz
    ./config/db_dump/vnpatient_db_dump.sql.gz
    ./config/db_dump/phone_db_dump.sql.gz
    ./config/db_dump/open_library_db_dump.sql.gz
    ./config/db_dump/mongo_db_dump.gz

## Restore database

    make restore-all-dbs

## Verify installation by visiting site below:
  * [Admin Portal](https://local-hi-admin.wehost.asia) with user access below:
    * super-admin@we.co / Super@Admin
    * organization-admin@we.co / Organization@Admin
    * country-admin@we.co / Country@Admin
    * clinic-admin@we.co / Clinic@Admin
  * [Therapist Portal](https://local-hi-therapist.wehost.asia) with user access below:
    * therapist@we.co / Therapist@Portal
  * [Library Portal](https://local-hi-library.wehost.asia) with user access below:
    * library@we.co / Library@Portal

## Configure environment variables

  > Edit `vi ../admin-service/.env` by replacing value for `KEYCLOAK_BACKEND_SECRET` getting from `hi` Realm -> Clients

  > Edit `vi ../therapist-service/.env` by replacing value for `KEYCLOAK_BACKEND_SECRET` getting from `hi-therapist` Realm -> Clients

## Migrate database tables

  ```bash
  docker-compose run --rm admin_service php artisan migrate
  docker-compose run --rm therapist_service php artisan migrate
  docker-compose run --rm patient_service php artisan migrate
  ```

  > Access database via user interface: [http://localhost:8060/](http://localhost:8060/)

### Enjoy your development on `admin-web-app` or `therapist-web-app`

# Setup apache superset

  ```bash
  make
  make docker-net
  make apache-superset
  ```

# Setup Presto

  ```bash
  make
  make docker-net
  make presto
  ```

## Presto configuration files

  ```bash
  ./config/docker/presto/etc
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
