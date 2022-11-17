# Docker-creator
A docker CLI tool to generate web projects

# Usage
Pour initialiser un projet, copier la ligne suivante dans un terminal : 

```bash
docker pull timinh/docker-creator && docker run --rm -it -v $PWD:/app/public:rw timinh/docker-creator init
```
Pour afficher la liste des commandes disponibles : 

```bash
docker run --rm -it -v $PWD:/app/public:rw timinh/docker-creator
```

# Commandes disponibles :
    - init
    - add-container
    - remove-container
    - create-docker-compose
    - enable-ci
    - update

# Container disponibles (via `add-container`) : 
    - apache-php
    - elasticsearch (cluster avec 3 nodes)
    - mariadb
    - rabbitmq
    - redis
    - typesense
    - maildev (en dev uniquement)
    - nodejs (en dev uniquement)

# Todo :
    - Ajouter containers nginx et php-fpm