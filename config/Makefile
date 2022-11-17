.DEFAULT_GOAL = help

CONTAINER_NAME=$$(grep APP_NAME .env | cut -d '=' -f2-)_app
FRONTCONTAINER_NAME=$$(grep APP_NAME .env | cut -d '=' -f2-)_front
SYMFONY_VERSION=$$(grep SYMFONY_VERSION .env | cut -d '=' -f2-)
DOCKER_COMPOSE=@docker-compose
DOCKER_EXEC=@docker exec -it
COMPOSER=$(DOCKER_EXEC) $(CONTAINER_NAME) composer
DOCKER_COMPOSE_PROD_FILE=docker-compose.production.yml

help:
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help

## —— Commandes disponibles     ———————————————————————————————————————————————
add-container: ## Ajoute un container dans le docker-compose	
	@docker run --rm -it -v $(PWD):/app/public:rw timinh/docker-creator add-container
.PHONY: add-container

remove-container: ## Supprime un container dans le docker-compose	
	@docker run --rm -it -v $(PWD):/app/public:rw timinh/docker-creator remove-container
.PHONY: remove-container

enable-ci: ## Ajoute le fichier d'intégration continue à la racine du projet
	@docker run --rm -it -v $(PWD):/app/public:rw timinh/docker-creator enable-ci
.PHONY: enable-ci

## —— Docker 🐳  ———————————————————————————————————————————————————————————————
start:	## Lancer les containers docker (en mode dev)
	$(DOCKER_COMPOSE) up -d --build
.PHONY: start

stop:	## Arréter les containers docker
	$(DOCKER_COMPOSE) down
.PHONY: stop

restart: stop start	## redémarrer les containers (en mode dev)
.PHONY: restart

bash: ## Connexion au container
	$(DOCKER_EXEC) $(CONTAINER_NAME) bash
.PHONY: bash

bash-front:	## Connexion au container front (nodejs)
	$(DOCKER_EXEC) $(FRONTCONTAINER_NAME) bash
.PHONY: bash
	
ps: ## Affiche les containers docker
	@docker ps
.PHONY: ps

prod: compose ## Builde et lance les containers docker (en mode prod)
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_PROD_FILE) up -d --build
.PHONY: prod

compose: ## Génère un docker-compose.yml avec les variables utiles l'intégration dans portainer
	@docker run --rm -it -v $(PWD):/app/public:rw timinh/docker-creator create-docker-compose
.PHONY: compose

## —— Composer 🎵 ——————————————————————————————————————————————————————————————
create-skeleton: ## Création d'un projet symfony skeleton dans le dossier app
	@$(DOCKER_EXEC) $(CONTAINER_NAME) rm -Rf public/
	$(COMPOSER) create-project symfony/skeleton:"$(SYMFONY_VERSION)" .
	@$(DOCKER_EXEC) $(CONTAINER_NAME) chmod -R 777 /var/www/html
.PHONY: create-skeleton

create-symfony: create-skeleton ## Création d'un projet symfony complet dans le dossier app
	$(COMPOSER) require webapp
	@$(DOCKER_EXEC) $(CONTAINER_NAME) chmod -R 777 /var/www/html
.PHONY: create-symfony

create-symfony-vue: ## Création d'un projet full-stack symfony 6 / vue 3 (SPA)
	@$(DOCKER_EXEC) $(CONTAINER_NAME) rm -Rf public/
	@$(DOCKER_EXEC) $(CONTAINER_NAME) git clone https://github.com/timinh/template-symfony-vite.git .
	@$(DOCKER_EXEC) $(CONTAINER_NAME) chmod -R 777 /var/www/html
	@$(DOCKER_EXEC) $(CONTAINER_NAME) rm -R /var/www/html/.git
	@echo "Le template est installé, utilisez les commandes 'make stop' puis 'make add-container' pour ajouter nodejs à votre stack avant de la redémarrer"
.PHONY: create-symfony-vue

vendor-install:	## Installation des vendors
	$(COMPOSER) install
.PHONY: vendor-install

vendor-update:	## Mise à jour des vendors
	$(COMPOSER) update
.PHONY: vendor-update

clean-vendor: ## Suppression du répertoire vendor puis un réinstall
	$(DOCKER_EXEC) $(CONTAINER_NAME) rm -Rf vendor
	$(DOCKER_EXEC) $(CONTAINER_NAME) rm composer.lock
	$(COMPOSER) install
.PHONY: clean-vendor

## —— Versioning 🛠️️ ———————————————————————————————————————————————————————————————
tag: ## Met à jour le tag dans le docker-compose (pour mise à jour en prod)
	@sed -i "s/APP_TAG=*.*/APP_TAG=`date +%s`/g" .env
	@docker run --rm -it -v $(PWD):/app/public:rw timinh/docker-creator create-docker-compose
.PHONY: tag
