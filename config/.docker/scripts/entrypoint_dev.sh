#!/usr/bin/env bash

export HTTPS_PROXY=http://proxy.dsi.uca.fr:8080
export HTTP_PROXY=http://proxy.dsi.uca.fr:8080
export NO_PROXY=".uca.fr,localhost,gitlab.dsi.uca.fr,.dev.dsi.uca.fr"

# dépendances
composer install --no-interaction

# database
php bin/console doctrine:database:create --if-not-exists

# migrations
# php bin/console doctrine:migrations:migrate --no-interaction

# fixtures
#php bin/console doctrine:fixtures:load --no-interaction
 
exec "$@"