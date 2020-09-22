# Overview

This repository is where Telerehabilitation App implemented in Microservices and using docker-compose and single sign on with keycloak.

# Maintainer

* Web Essentials Co., Ltd

# Required Dependencies

* PHP >= 7.3
* Node >= 10

* [Git](https://git-scm.com/)
* [Composer](https://getcomposer.org/)
* [Docker](https://docs.docker.com/install/) >= v17.12
* [docker-compose](https://docs.docker.com/compose/install/#install-compose) >= 1.12

# Local environment with Docker

* Clone project to your development workspace

    ```bash
    git clone git@git.web-essentials.asia:hiv-tra-20/Distribution.git ~/dev/docker-projects/hiv/Distribution
    ```

* Navigate to your project

    ```bash
    cd ~/dev/docker-projects/hiv/Distribution
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

# Useful docker command

* Manually up docker

    ```bash
    docker-compose up -d
    ```

* Manually kill running docker

    ```bash
    docker-compose kill
    ```
