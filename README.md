# Docker-creator
A docker CLI tool to generate web projects

# Usage
Pour initialiser un projet, copier la ligne suivante dans un terminal : 

```bash
docker run --rm -it -v $PWD:/app/public:rw timinh/docker-creator init
```
Pour afficher la liste des commandes disponibles : 

```bash
docker run -rm -it -v $PWD:/public:rw timinh/docker-creator
```

# Available commands
    - init
    - add-container
    - remove-container
    - update
