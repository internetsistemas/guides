## Useful Commands

### Images
`docker images`: lists images

`docker rmi ID`: remove image(s)

`docker build`: builds an image

`docker run`: runs a single image as a container

### Containers
`docker ps`: lists containers

`docker rm ID`: remove container(s)
 - removing all containers: `docker rm $(docker ps -a -q)`

 > Be careful as when removing containers associated volumes are also wiped.

`docker inspect ID`: inspects a container
 - removing all images: `docker rmi $(docker images -q)`

### Docker Compose
`docker-compose build`: builds up containers based up on `docker-compose.yml`

`docker-compose up`: builds an run containers(services)

`docker-compose down`: tears down containers, volumes and everything related to them

`docker-compose start/stop SERVICE`: starts/stops a single service by its name

`docker-compose run SERVICE COMMAND`: runs a command from within a service
  - e.g.: `docker-compose run web /bin/bash`
