function install() {
	echo "Installation du container apache-php..."
	sed $'/### containers ###/{e cat templates/apache-php/docker-compose.override.yml\n}' public/docker-compose.override.yml -i
	sed $'/### containers ###/{e cat templates/apache-php/docker-compose.yml\n}' public/docker-compose.yml -i
	echo "Les docker-compose et docker-compose.override ont été mis à jour."
    sed -i 's/APP_DOCKERFILE=.*/APP_DOCKERFILE=.docker\/dockerfiles\/php\/Dockerfile/' public/.env
}

function unInstall() {
	echo "désinstallation du container apache-php"
	sed '/###> apache-php ###/,/### apache-php ###/d' public/docker-compose.override.yml -i
	sed '/###> apache-php ###/,/### apache-php ###/d' public/docker-compose.yml -i
	echo "le container apache-php a été désinstallé."
}