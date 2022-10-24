function install() {
	echo "installation du container maildev..."
	sed $'/### containers ###/{e cat templates/maildev/docker-compose.override.yml\n}' public/docker-compose.override.yml -i
	echo "Le docker-compose.override a été mis à jour."
}

function unInstall() {
	echo "désinstallation du container maildev"
}