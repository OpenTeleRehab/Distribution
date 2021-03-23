# Overview

This repository is where OpenRehab App implemented in Microservices and using docker-compose and single sign on with keycloak.

# Maintainer

* Web Essentials Co., Ltd

# Required Dependencies

* PHP >= 7.3
* [NodeJS](https://nodejs.org/en/download/package-manager/) version >= 10.0.0 < 15.0.0
* [Yarn](https://yarnpkg.com/lang/en/docs/install/#debian-stable) version == 1.22.x
* [Git](https://git-scm.com/) version >= 2.0.0
* [Composer](https://getcomposer.org/)
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
    sudo chown -R ${USER}:${USER} .
    ```

* Run script to set up

    ```bash
    chmod u+x local_setup/setup.sh
    ./local_setup/setup.sh
    ```
    > Note: Actually, the script is trying to kill all conflict ports but sometimes it could not. So if there are conflict ports, you have to kill it first then rerun the script.
    Here is the command to kill the port in Linux: `sudo kill $(sudo lsof -t -i:PORT_TO_FREE)`.

* Verify installation by visit [http://local-rehabilitation.wehost.asia](http://local-rehabilitation.wehost.asia) on the browser.

## Configure Keycloak

* Try login through [http://local-rehabilitation.wehost.asia/auth](http://local-rehabilitation.wehost.asia/auth) with credentials from `docker-compose.yml`

  > If it does not work, copy all content from file `docker-compose-dev.yml` (expose static port) to replace `docker-compose.yml` and restart all containers `docker-compose up -d`

  > Re-try login through [http://localhost:8080/auth/](http://localhost:8080/auth/) with same credentials

* Import and update Realm Settings

  1. Export Realm from Latest or Demo `hi` and `hi-therapist`
  2. Import those two Realm into your local running Keycloak
  3. Update `Frontend URL` of each Realm Settings to `http://local-rehabilitation.wehost.asia/auth` or `http://localhost:8080/auth/` (depend on which URL you have logged in success)

* Create default user to generate access token (DO NOT DELETE these users)

  __Note:__ These users should have primary client roles: `manager-users`, `query-groups`, and `query-users` (Client Roles -> realm-management)

  1. Create `hi_backend` with password `hi_backendDBPWD` on `hi` Realm
  2. Create `therapist_backend` with password `therapist_backendDBPWD` on `therapist` Realm

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
