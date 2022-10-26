#!/bin/bash -e
cat config/.gitlab-ci.yml.txt > public/.gitlab-ci.yml
chmod -R 777 public/
echo "le fichier gitlab-ci.yml a été ajouté à votre projet."