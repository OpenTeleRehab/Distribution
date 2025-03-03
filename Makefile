SHELL=/bin/bash

colorOff=\033[0m
colorGreen=\033[92m
colorYellow=\033[33m
define echo_title
	@echo -e "${colorGreen}*** ${1} ***${colorOff}"
endef
define echo_section
	@echo -e "${colorYellow}${1}${colorOff}"
endef

# host name
SUPERSET_HOST ?= local-hi-superset.wehost.asia
PRESTO_HOST ?= local-hi-presto.wehost.asia
TRINO_HOST ?= local-hi-trino.wehost.asia

DOCKER_COMPOSE := docker compose
# The default target
all: help
# Help target to display usage information
help:
	$(call echo_title, "Create network for docker")
	@echo "  make docker-net"
	@echo "  "
	@echo "  "
	$(call echo_section,"=====================================")
	$(call echo_section,"=========== APACHE SUPERSET =========")
	$(call echo_section,"https://$(SUPERSET_HOST)")
	$(call echo_section,"=====================================")
	$(call echo_title, "Start apache superset service")
	@echo "  make apache-superset"
	@echo "  "
	$(call echo_title, "Other command Apachesuperset:")
	@echo "  make superset-compose"
	@echo "  make superset-kill"
	@echo "  make superset-ps"
	@echo "  make superset-execdb"
	@echo "  make superset-dbdump"
	@echo "  make superset-dbrestore"
	$(call echo_section,"===================================")
	$(call echo_section,"=========== PRESTO ================")
	$(call echo_section,"https://$(PRESTO_HOST)")
	$(call echo_section,"===================================")
	$(call echo_title, "Start presto service")
	@echo "  make presto"
	@echo "  "
	$(call echo_title, "Other command presto service:")
	@echo "  make presto-compose"
	@echo "  make presto-ps"
	@echo "  make presto-kill"
	@echo "  make presto-exec"
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
docker-net:
	docker network create docker-net
### Apache Superset ###

apache-superset:
	docker-compose -f docker-compose-superset.yml up -d
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

### Presto ###
presto:
	@$(DOCKER_COMPOSE) -f docker-compose-presto.yml up -d
	$(call echo_title, "Add host to /etc/hosts")
	@if [ `grep -o "$(PRESTO_HOST)" /etc/hosts | wc -l` = 0 ]; then\
		sudo bash -c "echo 0.0.0.0 $(PRESTO_HOST) >> /etc/hosts";\
	else\
		echo "==> Skip: host already existed.";\
	fi

presto-docker:
	@$(DOCKER_COMPOSE) -f docker-compose-presto.yml $(filter-out $@,$(MAKECMDGOALS))

presto-ps:
	@$(DOCKER_COMPOSE) -f docker-compose-presto.yml ps

presto-kill:
	@$(DOCKER_COMPOSE) -f docker-compose-presto.yml kill

presto-exec:
	@$(DOCKER_COMPOSE) -f docker-compose-presto.yml exec presto /bin/bash

presto-compose:
	@$(DOCKER_COMPOSE) -f docker-compose-presto.yml $(filter-out $@,$(MAKECMDGOALS))

### Trino ###
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