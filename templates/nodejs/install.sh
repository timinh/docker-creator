function install() {
	echo "Installation du container nodejs..."
	sed $'/### containers ###/{e cat templates/nodejs/docker-compose.override.yml\n}' public/docker-compose.override.yml -i
	echo "Les docker-compose et docker-compose.override ont été mis à jour."
    sed -i 's/APP_DOCKERFILE=.*/APP_DOCKERFILE=.docker\/dockerfiles\/phpnode\/Dockerfile/' public/.env
}

function unInstall() {
	echo "désinstallation du container nodejs"
}