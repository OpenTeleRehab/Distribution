SHELL=/bin/bash
-include .env
UID := $(shell id -u)

colorOff=\033[0m
colorGreen=\033[92m
colorYellow=\033[33m
coloreRed=\033[31m

# Define colors
define echo_title
	@echo -e "${colorGreen}*** ${1} ***${colorOff}"
endef
define echo_section
	@echo -e "${colorYellow}${1}${colorOff}"
endef
define echo_error
	@echo -e "${coloreRed}${1}${colorOff}"
endef

# GIT HOST
# GIT_HOST := git@github.com:OpenTeleRehab
GIT_HOST := git@git.web-essentials.asia:hiv-tra-20

# host name
SUPERSET_HOST ?= local-hi-superset.wehost.asia
TRINO_HOST ?= local-hi-trino.wehost.asia

# Detect whether "docker-compose" or "docker compose" is available
DOCKER_COMPOSE := $(shell command -v docker-compose 2>/dev/null || (command -v docker >/dev/null && echo "docker compose") || echo "")

# Ensure DOCKER_COMPOSE is set
ifeq ($(DOCKER_COMPOSE),)
  $(error "Neither 'docker-compose' nor 'docker compose' found. Please install Docker Compose.")
endif

# The default target
all: help
# Help target to display usage information
help:
	$(call echo_section,"=====================================")
	$(call echo_section,"=========== SETUP PROJECT =========")
	$(call echo_section,"https://$(ADMIN_HOST)")
	$(call echo_section,"https://$(THERAPIST_HOST)")
	$(call echo_section,"https://$(PATIENT_HOST)")
	$(call echo_section,"https://$(PHONE_HOST)")
	$(call echo_section,"https://$(LIBRARY_HOST)")
	$(call echo_section,"https://$(ROCKETCHAT_HOST)")
	$(call echo_section,"=====================================")
	$(call echo_title, "Setup projects")
	@echo "  make setup"
	@echo "  "
	@echo "  "
	$(call echo_section, "Skip below steps if you run make setup")
	$(call echo_title, "Create network for docker name: docker-net")
	@echo "  make docker-network"
	$(call echo_title, "Create docker .env file from dot-env.example")
	@echo "  make docker-env"
	$(call echo_title, "Start all database services")
	@echo "  make up-db-services"
	$(call echo_title, "Restore all database services")
	$(call echo_section, "database dump files in ./config/db_dump")
	@echo "  make restore-all-dbs"
	$(call echo_title, "Clone and pull code repositories")
	@echo "  make git-pull"
	$(call echo_title, "Copy .env file from .env.example for all services")
	@echo "  make projects-env"
	$(call echo_title, "Install composer dependencies for all services")
	@echo "  make composer-install"
	$(call echo_title, "Install NPM package dependencies for all webapps")
	@echo "  make install-npm"
	$(call echo_title, "Start all services")
	@echo "  make compose-up"

	$(call echo_section,"=====================================")
	$(call echo_section,"=========== APACHE SUPERSET =========")
	$(call echo_section,"https://$(SUPERSET_HOST)")
	$(call echo_section,"=====================================")
	$(call echo_title, "Start apache superset service")
	@echo "  make superset"
	@echo "  "
	$(call echo_title, "Other command Apachesuperset:")
	@echo "  make superset-compose"
	@echo "  make superset-kill"
	@echo "  make superset-ps"
	@echo "  make superset-execdb"
	@echo "  make superset-dbdump"
	@echo "  make superset-dbrestore"
	$(call echo_section,"===================================")
	$(call echo_section,"=========== TRINO ================")
	$(call echo_section,"https://$(TRINO_HOST)")
	$(call echo_section,"===================================")
	$(call echo_title, "Start trino service")
	@echo "  make trino"
	@echo "  "
	$(call echo_title, "Other command trino service:")
	@echo "  make trino-compose"
	@echo "  make trino-ps"
	@echo "  make trino-kill"
	@echo "  make trino-exec"
### END HELP TEXT###
######################
### Setup Project  ###
######################
setup:
	$(call echo_title, "Create default docker network name: docker-net")
	$(MAKE) docker-network
	$(call echo_title, "Create .env file from dot-env.example")
	$(MAKE) docker-env
	$(call echo_title, "Start all database services")
	$(MAKE) up-db-services
	$(call echo_title, "Wait 30 seconds for database services to start")
	sleep 30
	$(call echo_title, "Restore all database")
	$(MAKE) restore-all-dbs
	$(call echo_title, "Clone and pull code repositories")
	$(MAKE) git-pull
	$(call echo_title, "Copy .env file from .env.example for all services")
	$(MAKE) projects-env
	$(call echo_title, "Install composer dependencies for all services")
	$(MAKE) composer-install
	$(call echo_title, "Install NPM package dependencies for all webapps")
	$(MAKE) install-npm
	$(call echo_title, "Start all services")
	$(MAKE) compose-up


######################
### Docker network ###
######################
docker-network:
	@if [ `docker network ls | grep -o "docker-net" | wc -l` = 0 ]; then\
		docker network create docker-net;\
	else\
		echo "==> Skip: network already existed.";\
	fi

docker-env:
	$(call echo_title, "Create .env file from dot-env.example")
	@if [ -f ".env" ]; then\
		echo "==> Skip: .env is already exist";\
	else\
		cp dot-env.example .env;\
		sed -i 's/^USER_ID=.*/USER_ID=${UID}/' .env; \
		echo "==> The .env is copied form dot-env.example";\
	fi

###############################
### SETUP DATABASE SERVICES ###
###############################

up-db-services:
	$(call echo_title, "Start all database services")
	@$(DOCKER_COMPOSE) -f docker-compose.yml up -d $(KC_SERVICE_DB_NAME) $(ADMIN_SERVICE_DB_NAME) $(THERAPIST_SERVICE_DB_NAME) $(PATIENT_SERVICE_DB_NAME) $(VNPATIENT_SERVICE_DB_NAME) $(PHONE_SERVICE_DB_NAME) $(OPEN_LIBRARY_SERVICE_DB_NAME) $(MONGO_SERVICE_NAME)

restore-all-dbs:
	$(call echo_title, "Restore all database")
	$(MAKE) restore-keycloak-db
	$(MAKE) restore-admin-db
	$(MAKE) restore-therapist-db
	$(MAKE) restore-patient-db
	$(MAKE) restore-vnpatient-db
	$(MAKE) restore-phone-db
	$(MAKE) restore-open-library-db
	$(MAKE) restore-mongo-db

restore-keycloak-db:
	$(call echo_title, "Restore keycloak database")
	@if [ -f "./config/db_dump/kc_db_dump.sql.gz" ]; then \
		gunzip < ./config/db_dump/kc_db_dump.sql.gz | $(DOCKER_COMPOSE) -f docker-compose.yml exec -T $(KC_SERVICE_DB_NAME) sh -c 'exec mysql -uroot -p$(DB_ROOT_PASS) $(KC_DB_NAME)'; \
	else \
		echo "==> ./config/db_dump/kc_db_dump.sql.gz does not exist"; \
	fi

restore-admin-db:
	$(call echo_title, "Restore admin database")
	@if [ -f "./config/db_dump/admin_db_dump.sql.gz" ]; then \
		gunzip < ./config/db_dump/admin_db_dump.sql.gz | $(DOCKER_COMPOSE) -f docker-compose.yml exec -T $(ADMIN_SERVICE_DB_NAME) sh -c 'exec mysql -uroot -p$(DB_ROOT_PASS) $(ADMIN_DB_NAME)'; \
	else \
		echo "==> ./config/db_dump/admin_db_dump.sql.gz does not exist"; \
	fi

restore-therapist-db:
	$(call echo_title, "Restore therapist database")
	@if [ -f "./config/db_dump/therapist_db_dump.sql.gz" ]; then \
		gunzip < ./config/db_dump/therapist_db_dump.sql.gz | $(DOCKER_COMPOSE) -f docker-compose.yml exec -T $(THERAPIST_SERVICE_DB_NAME) sh -c 'exec mysql -uroot -p$(DB_ROOT_PASS) $(THERAPIST_DB_NAME)'; \
	else \
		echo "==> ./config/db_dump/therapist_db_dump.sql.gz does not exist"; \
	fi	

restore-patient-db:	
	$(call echo_title, "Restore patient database")
	@if [ -f "./config/db_dump/patient_db_dump.sql.gz" ]; then \
		gunzip < ./config/db_dump/patient_db_dump.sql.gz | $(DOCKER_COMPOSE) -f docker-compose.yml exec -T $(PATIENT_SERVICE_DB_NAME) sh -c 'exec mysql -uroot -p$(DB_ROOT_PASS) $(PATIENT_DB_NAME)'; \
	else \
		echo "==> ./config/db_dump/patient_db_dump.sql.gz does not exist"; \
	fi

restore-vnpatient-db:
	$(call echo_title, "Restore vnpatient database")
	@if [ -f "./config/db_dump/vnpatient_db_dump.sql.gz" ]; then \
		gunzip < ./config/db_dump/vnpatient_db_dump.sql.gz | $(DOCKER_COMPOSE) -f docker-compose.yml exec -T $(VNPATIENT_SERVICE_DB_NAME) sh -c 'exec mysql -uroot -p$(DB_ROOT_PASS) $(VNPATIENT_DB_NAME)'; \
	else \
		echo "==> ./config/db_dump/vnpatient_db_dump.sql.gz does not exist"; \
	fi

restore-phone-db:
	$(call echo_title, "Restore phone database")
	@if [ -f "./config/db_dump/phone_db_dump.sql.gz" ]; then \
		gunzip < ./config/db_dump/phone_db_dump.sql.gz | $(DOCKER_COMPOSE) -f docker-compose.yml exec -T $(PHONE_SERVICE_DB_NAME) sh -c 'exec mysql -uroot -p$(DB_ROOT_PASS) $(PHONE_DB_NAME)'; \
	else \
		echo "==> ./config/db_dump/phone_db_dump.sql.gz does not exist"; \
	fi

restore-open-library-db:
	$(call echo_title, "Restore library database")
	@if [ -f "./config/db_dump/open_library_db_dump.sql.gz" ]; then \
		gunzip < ./config/db_dump/open_library_db_dump.sql.gz | $(DOCKER_COMPOSE) -f docker-compose.yml exec -T $(OPEN_LIBRARY_SERVICE_DB_NAME) sh -c 'exec mysql -uroot -p$(DB_ROOT_PASS) $(LIBRARY_DB_NAME)'; \
	else \
		echo "==> ./config/db_dump/open_library_db_dump.sql.gz does not exist"; \
	fi

restore-mongo-db:
	$(call echo_title, "Restore mongo database")
	@if [ -f "./config/db_dump/mongo_db_dump.gz" ]; then \
		$(DOCKER_COMPOSE) -f docker-compose.yml exec -T $(MONGO_SERVICE_NAME) mongorestore --archive < ./config/db_dump/mongo_db_dump.gz; \
	else \
		echo "==> ./config/db_dump/mongo_db_dump.gz does not exist"; \
	fi

#################
### GIT CLONE ###
#################
adminPath := ../admin-service
therapistPath := ../therapist-service
patientPath := ../patient-service
adminWebPath := ../admin-web-app
therapistWebPath := ../therapist-web-app
keycloakPath := ../keycloak
krakendPath := ../krakend
openLibraryPath := ../open-library-service
openLibraryWebPath := ../open-library-web-app
phonePath := ../phone-service

git-pull:
	$(call echo_title, "Clone dependency repositories")
	git -C ${adminPath} pull || git clone $(GIT_HOST)/admin-service.git ${adminPath}
	git -C ${therapistPath} pull || git clone $(GIT_HOST)/therapist-service.git ${therapistPath}
	git -C ${patientPath} pull || git clone $(GIT_HOST)/patient-service.git ${patientPath}
	git -C ${adminWebPath} pull || git clone $(GIT_HOST)/admin-web-app.git ${adminWebPath}
	git -C ${therapistWebPath} pull || git clone $(GIT_HOST)/therapist-web-app.git ${therapistWebPath}
	git -C ${keycloakPath} pull || git clone $(GIT_HOST)/keycloak.git ${keycloakPath}
	git -C ${krakendPath} pull || git clone $(GIT_HOST)/krakend.git ${krakendPath}
	git -C ${openLibraryPath} pull || git clone $(GIT_HOST)/hic-service.git ${openLibraryPath}
	git -C ${openLibraryWebPath} pull || git clone $(GIT_HOST)/hic-webapp.git ${openLibraryWebPath}
	git -C ${phonePath} pull || git clone $(GIT_HOST)/phone-service.git ${phonePath}

projects-env:
	$(call echo_title, "Create .env file from dot-env.example")
	@if [ -f "${adminPath}/.env" ]; then\
		echo "==> Skip: ${adminPath}/.env is already exist";\
	else\
		cp ${adminPath}/.env.example ${adminPath}/.env;\
		echo "==> The ${adminPath}/.env is copied form ${adminPath}/.env.example";\
	fi

	@if [ -f "${therapistPath}/.env" ]; then\
		echo "==> Skip: ${therapistPath}/.env is already exist";\
	else\
		cp ${therapistPath}/.env.example ${therapistPath}/.env;\
		echo "==> The ${therapistPath}/.env is copied form ${therapistPath}/.env.example";\
	fi

	@if [ -f "${patientPath}/.env" ]; then\
		echo "==> Skip: ${patientPath}/.env is already exist";\
	else\
		cp ${patientPath}/.env.example ${patientPath}/.env;\
		echo "==> The ${patientPath}/.env is copied form ${patientPath}/.env.example";\
	fi

	@if [ -f "${phonePath}/.env" ]; then\
		echo "==> Skip: ${phonePath}/.env is already exist";\
	else\
		cp ${phonePath}/.env.example ${phonePath}/.env;\
		echo "==> The ${phonePath}/.env is copied form ${phonePath}/.env.example";\
	fi

	@if [ -f "${openLibraryPath}/.env" ]; then\
		echo "==> Skip: ${openLibraryPath}/.env is already exist";\
	else\
		cp ${openLibraryPath}/.env.example ${openLibraryPath}/.env;\
		echo "==> The ${openLibraryPath}/.env is copied form ${openLibraryPath}/.env.example";\
	fi

############################################
### Run composer to install dependencies ###
############################################
composer-install:
	$(MAKE) composer-install-admin
	$(MAKE) composer-install-therapist
	$(MAKE) composer-install-patient
	$(MAKE) composer-install-phone
	$(MAKE) composer-install-openlibrary

composer-install-admin:
	$(call echo_title, "Run composer install $(ADMIN_SERVICE_NAME)")
	$(DOCKER_COMPOSE) -f docker-compose.yml run --no-deps $(ADMIN_SERVICE_NAME) composer install --prefer-dist -vv

composer-install-therapist:
	$(call echo_title, "Run composer install $(THERAPIST_SERVICE_NAME)")
	$(DOCKER_COMPOSE) -f docker-compose.yml run --no-deps $(THERAPIST_SERVICE_NAME) composer install --prefer-dist -vv

composer-install-patient:
	$(call echo_title, "Run composer install $(PATIENT_SERVICE_NAME)")
	$(DOCKER_COMPOSE) -f docker-compose.yml run --no-deps $(PATIENT_SERVICE_NAME) composer install --prefer-dist -vv

composer-install-phone:
	$(call echo_title, "Run composer install $(PHONE_SERVICE_NAME)")
	$(DOCKER_COMPOSE) -f docker-compose.yml run --no-deps $(PHONE_SERVICE_NAME) composer install --prefer-dist -vv

composer-install-openlibrary:
	$(call echo_title, "Run composer install $(OPEN_LIBRARY_SERVICE_NAME)")
	$(DOCKER_COMPOSE) -f docker-compose.yml run --no-deps $(OPEN_LIBRARY_SERVICE_NAME) composer install --prefer-dist -vv

############################################
### Run install NPM package dependencies ###
############################################
install-npm:
	$(call echo_title, "Run install NPM package dependencies")
	$(MAKE) install-npm-admin
	$(MAKE) install-npm-therapist
	$(MAKE) install-npm-library

install-npm-admin:
	$(call echo_title, "Run install NPM package dependencies $(ADMIN_WEB_APP_NAME)")
	$(DOCKER_COMPOSE) -f docker-compose.yml run --no-deps $(ADMIN_WEB_APP_NAME) yarn --frozen-lockfile

install-npm-therapist:
	$(call echo_title, "Run install NPM package dependencies $(THERAPIST_WEB_APP_NAME)")
	$(DOCKER_COMPOSE) -f docker-compose.yml run --no-deps $(THERAPIST_WEB_APP_NAME) yarn --frozen-lockfile

install-npm-library:
	$(call echo_title, "Run install NPM package dependencies $(LIBRARY_WEB_APP_NAME)")
	$(DOCKER_COMPOSE) -f docker-compose.yml run --no-deps $(LIBRARY_WEB_APP_NAME) yarn --frozen-lockfile

######################################
### docker compose up all services ###
######################################
add-hosts:
	$(call echo_title, "Add host to /etc/hosts")
	@if [ `grep -o "$(ADMIN_HOST)" /etc/hosts | wc -l` = 0 ]; then\
		sudo bash -c "echo 0.0.0.0 $(ADMIN_HOST) $(THERAPIST_HOST) $(PATIENT_HOST) $(PHONE_HOST) $(LIBRARY_HOST) $(NONHI_ADMIN_HOST) $(NONHI_THERAPIST_HOST) $(NONHI_PATIENT) >> /etc/hosts";\
	else\
		echo "==> Skip: host already existed.";\
	fi

patient_service_passport:
	$(call echo_title, "Run composer install $(PATIENT_SERVICE_NAME)")
	$(DOCKER_COMPOSE) -f docker-compose.yml exec --user www-data $(PATIENT_SERVICE_NAME) /usr/bin/php /var/www/html/artisan passport:install

compose-up:
	$(MAKE) add-hosts
	@$(DOCKER_COMPOSE) -f docker-compose.yml up -d
	sleep 10
	@$(DOCKER_COMPOSE) -f docker-compose.yml up -d client_web_app proxy

	$(call echo_title, "READY")
	$(call echo_section, "https://${ADMIN_HOST}/")
	$(call echo_section, "https://${THERAPIST_HOST}/")
	$(call echo_section, "https://${PATIENT_HOST}/")
	$(call echo_section, "https://${PHONE_HOST}/")
	$(call echo_section, "https://${LIBRARY_HOST}/")

#######################
### Apache Superset ###
#######################
superset:
	@$(DOCKER_COMPOSE) -f docker-compose-superset.yml up -d
	$(call echo_title, "Add host to /etc/hosts")
	@if [ `grep -o "$(SUPERSET_HOST)" /etc/hosts | wc -l` = 0 ]; then\
		sudo bash -c "echo 0.0.0.0 $(SUPERSET_HOST) >> /etc/hosts";\
	else\
		echo "==> Skip: host already existed.";\
	fi

superset-ps:
	@$(DOCKER_COMPOSE) -f docker-compose-superset.yml ps

superset-kill:
	@$(DOCKER_COMPOSE) -f docker-compose-superset.yml kill

superset-execdb:
	@$(DOCKER_COMPOSE) -f docker-compose-superset.yml exec db /bin/bash

superset-dbdump:
	@$(DOCKER_COMPOSE) -f docker-compose-superset.yml exec -T db sh \
								-c 'exec pg_dump --clean --if-exists --no-owner --no-privileges -Usuperset -W superset' | \
								gzip > config/docker/superset/db_dump/pg_superset_db.sql.gz

superset-dbrestore:
	gunzip < config/docker/superset/db_dump/pg_superset_db.sql.gz | \
					@$(DOCKER_COMPOSE) -f docker-compose-superset.yml exec -T db sh -c 'exec psql -Usuperset -W superset'

superset-compose:
	@$(DOCKER_COMPOSE) -f docker-compose-superset.yml $(filter-out $@,$(MAKECMDGOALS))

#############
### Trino ###
#############
trino:
	@$(DOCKER_COMPOSE) -f docker-compose-trino.yml up -d
	$(call echo_title, "Add host to /etc/hosts" https://$(TRINO_HOST))
	$(call echo_title, https://$(TRINO_HOST))
	$(call echo_title, username: admin)
	@if [ `grep -o "$(TRINO_HOST)" /etc/hosts | wc -l` = 0 ]; then\
		sudo bash -c "echo 0.0.0.0 $(TRINO_HOST) >> /etc/hosts";\
	else\
		echo "==> Skip: host already existed.";\
	fi

trino-docker:
	@$(DOCKER_COMPOSE) -f docker-compose-trino.yml $(filter-out $@,$(MAKECMDGOALS))

trino-ps:
	@$(DOCKER_COMPOSE) -f docker-compose-trino.yml ps

trino-kill:
	@$(DOCKER_COMPOSE) -f docker-compose-trino.yml kill

trino-exec:
	@$(DOCKER_COMPOSE) -f docker-compose-trino.yml exec trino /bin/bash

trino-compose:
	@$(DOCKER_COMPOSE) -f docker-compose-trino.yml $(filter-out $@,$(MAKECMDGOALS))

%:
	@:
