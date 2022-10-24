function install() {
	echo "Installation du container rabbitmq..."
	sed $'/### containers ###/{e cat templates/rabbitmq/docker-compose.override.yml\n}' public/docker-compose.override.yml -i
	sed $'/### containers ###/{e cat templates/rabbitmq/docker-compose.yml\n}' public/docker-compose.yml -i
	echo "Les docker-compose et docker-compose.override ont été mis à jour."
	cat templates/rabbitmq/rabbitmq.env >> public/.env
	echo "Le fichier .env a été modifié."
}

function unInstall() {
	echo "désinstallation du container rabbitmq..."
	sed '/###> rabbitmq ###/,/### rabbitmq ###/d' public/docker-compose.override.yml -i
	sed '/###> rabbitmq ###/,/### rabbitmq ###/d' public/docker-compose.yml -i
	echo "le container rabbitmq a été désinstallé."
}