function install() {
	echo "Installation des containers elasticsearch/kibana..."
	sed $'/### containers ###/{e cat templates/elasticsearch/docker-compose.override.yml\n}' public/docker-compose.override.yml -i
	sed $'/### containers ###/{e cat templates/elasticsearch/docker-compose.yml\n}' public/docker-compose.yml -i
	# sed $'/### volumes ###/{e cat templates/elasticsearch/volumes.yml\n}' public/docker-compose.yml -i
	echo "Les docker-compose et docker-compose.override ont été mis à jour."
	cat templates/elasticsearch/elasticsearch.env >> public/.env
	echo "Le fichier .env a été modifié."
}

function unInstall() {
	echo "désinstallation des containers elasticsearch/kibana"
}