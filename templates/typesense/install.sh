function install() {
	echo "Installation de typesense"
	sed $'/### containers ###/{e cat templates/typesense/docker-compose.override.yml\n}' public/docker-compose.override.yml -i
	sed $'/### volumes ###/{e cat templates/typesense/volumes.yml\n}' public/docker-compose.override.yml -i
	sed $'/### containers ###/{e cat templates/typesense/docker-compose.yml\n}' public/docker-compose.yml -i
	echo "Les docker-compose et docker-compose.override ont été mis à jour."
	cat templates/typesense/typesense.env >> public/.env
	echo "Le fichier .env a été modifié."
}

function unInstall() {
	echo "désinstallation de typesense..."
	sed '/###> typesense ###/,/### typesense ###/d' public/docker-compose.override.yml -i
	sed '/###> typesense ###/,/### typesense ###/d' public/docker-compose.yml -i
	sed '/###> volumes_typesense ###/,/### volumes_typesense ###/d' public/docker-compose.override.yml -i
	echo "typesense a bien été désinstallé."
}
