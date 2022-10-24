function install() {
	echo "Installation du container mariadb..."
	sed $'/### containers ###/{e cat templates/mariadb/docker-compose.override.yml\n}' public/docker-compose.override.yml -i
	sed $'/### containers ###/{e cat templates/mariadb/docker-compose.yml\n}' public/docker-compose.yml -i
	echo "Les docker-compose et docker-compose.override ont été mis à jour."
}

function unInstall() {
	echo "désinstallation du container mariadb..."
	sed '/###> mariadb ###/,/### mariadb ###/d' public/docker-compose.override.yml -i
	sed '/###> mariadb ###/,/### mariadb ###/d' public/docker-compose.yml -i
	echo "le container mariadb a été désinstallé."
}