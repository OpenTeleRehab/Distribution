# Overview

This repository is where OpenRehab App implemented in Microservices and using docker-compose and single sign on with keycloak.

# Maintainer

* Web Essentials Co., Ltd

# Required Dependencies

* [Git](https://git-scm.com/) version >= 2.0.0
* [Docker](https://docs.docker.com/install/) version >= 17.12.0
* [docker-compose](https://docs.docker.com/compose/install/#install-compose) >= 1.12.0

# Local environment with Docker

* Clone project to your development workspace

    ```bash
    git clone git@git.web-essentials.asia:hiv-tra-20/Distribution.git ~/dev/docker-projects/hiv/distribution
    ```

* Navigate to your project

    ```bash
    cd ~/dev/docker-projects/hiv/distribution
    ```

* Run script to set up

    ```bash
    chmod u+x local_setup/setup.sh
    ./local_setup/setup.sh
    ```
    > Note: Actually, the script is trying to kill all conflict ports but sometimes it could not. So if there are conflict ports, you have to kill it first then rerun the script.
    Here is the command to kill the port in Linux: `sudo kill $(sudo lsof -t -i:PORT_TO_FREE)`.

* Verify installation by visiting site below:
  * [Admin Portal](https://local-hi-admin.wehost.asia) with user access below:
    * super-admin@we.co / sup3r@Admin
    * organization-admin@we.co / 0rganization@Admin
    * country-admin@we.co / c0untry@Admin
    * clinic-admin@we.co / cl1nic@Admin
  * [Therapist Portal](https://local-hi-therapist.wehost.asia) with user access below:
    * therapist@we.co / th3rapist@WE
  * [Library Portal](https://local-hi-library.wehost.asia) with user access below:
    * admin@we.co / admin@user

## Configure environment variables

  ```bash
  cp ../admin-service/.env.example ../admin-service/.env
  cp ../therapist-service/.env.example ../therapist-service/.env
  cp ../patient-service/.env.example ../patient-service/.env
  ```

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

# Useful docker command

* Manually up docker

    ```bash
    docker-compose up -d
    ```

* Manually kill running docker

    ```bash
    docker-compose kill
    ```

### Rocket Chat Configuration
  Please follow [Installation Doc](https://confluence.web-essentials.co/display/TRA/Rocket+Chat+Configuration+for+OpenRehab)

### Common Issues
* Invalid ssl certificate
  * Download [fullchain.pem](https://packages.web-essentials.asia/boxes/devssl/wehost.asia/fullchain.pem), [privkey.pem](https://packages.web-essentials.asia/boxes/devssl/wehost.asia/privkey.pem) files, and replace them into `./config/docker/ssl/`. Then please restart the docker containers.

  ```bash
  curl -o config/docker/ssl/fullchain.pem https://packages.web-essentials.asia/boxes/devssl/wehost.asia/fullchain.pem
  curl -o config/docker/ssl/privkey.pem https://packages.web-essentials.asia/boxes/devssl/wehost.asia/privkey.pem
  ```
