SHELL=/bin/bash

colorOff=\033[0m
colorGreen=\033[92m
define echo_title
	@echo -e "${colorGreen}*** ${1} ***${colorOff}"
endef

# The default target
all: help
# Help target to display usage information
help:
	$(call echo_title, "Create network for docker")
	@echo "  make docker-net"
	@echo "  "
	@echo "  "
	$(call echo_title, "APACHE SUPERSET:")
	@echo "  make apache-superset"
	@echo "  "
	$(call echo_title, "HOST_NAME: https://local-hi-superset.wehost.asia")
	@echo "  "
	$(call echo_title, "Other command Apachesuperset:")
	@echo "  make superset-kill"
	@echo "  make superset-ps"
	@echo "  make superset-execdb"
	@echo "  make superset-dbdump"
	@echo "  make superset-dbrestore"

docker-net:
	docker network create docker-net

apache-superset:
	docker-compose -f docker-compose-superset.yml up -d

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
