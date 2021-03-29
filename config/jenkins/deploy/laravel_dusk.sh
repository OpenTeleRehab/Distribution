#!/bin/bash

WORKSPACE="/home/jenkins/jenkins-slave/workspace/hiv-tra-20-rehabilitation.wehost.asia/test/admin-service"

echo "Composer install"
cd ${WORKSPACE} && /opt/php-versions/php74/bin/php /usr/local/bin/composer install

echo "Laravel dusk"
cd ${WORKSPACE} && /opt/php-versions/php74/bin/php artisan dusk:chrome-driver 89
cd ${WORKSPACE} && /opt/php-versions/php74/bin/php artisan dusk
