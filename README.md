# Docker-creator
A docker CLI tool to generate web projects

# Usage
Open a terminal window and add this command line : 

```bash
docker run -rm -it -v $PWD:/public:rw timinh/docker-creator
```
to show the list of available commands, or init a project with : 

```bash
docker run --rm -it -v $PWD:/app/public:rw timinh/docker-creator init
```

# Available commands
    - init
    - add-container
    - remove-container
    - update
