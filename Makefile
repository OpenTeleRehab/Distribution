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
	@echo "  make presto-ps"
	@echo "  make presto-kill"
	@echo "  make presto-exec"

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
	docker-compose -f docker-compose-superset.yml ps

superset-kill:
	docker-compose -f docker-compose-superset.yml kill

superset-execdb:
	docker-compose -f docker-compose-superset.yml exec db /bin/bash

superset-dbdump:
	docker-compose -f docker-compose-superset.yml exec -T db sh \
								-c 'exec pg_dump --clean --if-exists --no-owner --no-privileges -Usuperset -W superset' | \
								gzip > config/docker/superset/db_dump/pg_superset_db.sql.gz

superset-dbrestore:
	gunzip < config/docker/superset/db_dump/pg_superset_db.sql.gz | \
					docker-compose -f docker-compose-superset.yml exec -T db sh -c 'exec psql -Usuperset -W superset'

### Presto ###
presto:
	docker-compose -f docker-compose-presto.yml up -d
	$(call echo_title, "Add host to /etc/hosts")
	@if [ `grep -o "$(PRESTO_HOST)" /etc/hosts | wc -l` = 0 ]; then\
		sudo bash -c "echo 0.0.0.0 $(PRESTO_HOST) >> /etc/hosts";\
	else\
		echo "==> Skip: host already existed.";\
	fi

presto-ps:
	docker-compose -f docker-compose-presto.yml ps

presto-kill:
	docker-compose -f docker-compose-presto.yml kill

presto-exec:
	docker-compose -f docker-compose-presto.yml exec presto /bin/bash
