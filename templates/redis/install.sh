function install() {
	echo "Installation du container redis..."
	sed $'/### containers ###/{e cat templates/redis/docker-compose.override.yml\n}' public/docker-compose.override.yml -i
	sed $'/### containers ###/{e cat templates/redis/docker-compose.yml\n}' public/docker-compose.yml -i
	echo "Les docker-compose et docker-compose.override ont été mis à jour."
	cat templates/redis/redis.env >> public/.env
	echo "Le fichier .env a été modifié."
}

function unInstall() {
	echo "désinstallation du container redis..."
	sed '/###> redis ###/,/### redis ###/d' public/docker-compose.override.yml -i
	sed '/###> redis ###/,/### redis ###/d' public/docker-compose.yml -i
	sed '/###> volumes_redis ###/,/### volumes_redis ###/d' public/docker-compose.override.yml -i
	echo "le container redis a été désinstallé."
}