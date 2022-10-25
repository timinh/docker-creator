#!/bin/bash -e
read -p "Nom du projet (en minuscules, sans espace, sans accent) [monprojet] : " projectName
projectName=${projectName:-monprojet}

read -p "Dossier de l'application [app] : " appFolder
appFolder=${appFolder:-app}

echo "projet : $projectName créé"

cp -R config/* public/
cp -R config/.docker public/
cp config/.env public/
sed -i "s/XXXXX/$projectName/g" public/.env
sed -i "s/XXXXX/$projectName/g" public/README.md
sed -i "s/YYYYY/\/$appFolder/g" public/.env
mkdir public/$appFolder && mkdir public/$appFolder/public && cat config/index.php>public/$appFolder/public/index.php
chmod -R 777 public/

# sh bin/create-docker-compose.sh
echo "Votre projet a été initialisé, vous pouvez ajouter un premier conteneur en utilisant 'make add-container'"
echo "Pour démarrer la stack, utilisez 'make start'"
echo "N'oubliez pas de compléter la doc dans le README.md"