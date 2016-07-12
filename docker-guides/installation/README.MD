## Docker Install guides

[Installation Guides for Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntulinux/)

### Ubuntu

- Update APT

`sudo apt-get update`

- Make sure https support works and ca-certificates are installed

`sudo apt-get install apt-transport-https ca-certificates`

- Add the GPG key

`sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D`

- Open or create the file /etc/apt/sources.list.d/docker.list and delete any existing entries in it
- Add an entry based on your System
  - Ubuntu 12.04
    `deb https://apt.dockerproject.org/repo ubuntu-precise main`
  - Ubuntu 14.04
    `deb https://apt.dockerproject.org/repo ubuntu-trusty main`
  - Ubuntu 16.04
    `deb https://apt.dockerproject.org/repo ubuntu-xenial main`

- Update APT

  `sudo apt-get update`

- Purge the old repos if any

  `sudo apt-get purge lxc-docker`

- Verify that APT is pulling from correct repository

  `apt-cache policy docker-engine`

- For Ubuntu 14.04 and 16.04 install the `linux-image-extra` package

    `sudo apt-get update`

    `sudo apt-get install linux-image-extra-$(uname -r)`

- For Ubuntu 12.04 and 14.04 install apparmor also

  `sudo apt-get install apparmor`

- Intalling Docker

  `sudo apt-get update`

  `sudo apt-get install docker-engine`
- Start the docker daemon

  `$ sudo service docker start`

- Verifying docker is installed correctly

  `sudo docker run hello-world`

- Creating a docker group

  `sudo groupadd docker`
  `sudo usermod -aG docker $USER`
  - Log out and log back in your shell session and verify your docker runs without sudo (reboot)

  `docker run hello-world`

- Create an account in [Docker Hub](https://hub.docker.com)

## Docker Compose

- Get latest stable release from [docker-compose releases](https://github.com/docker/compose/releases)

Example:

  - curl -L https://github.com/docker/compose/releases/download/1.8.0-rc1/docker-compose-`uname -s`-`uname -m` > ~/docker-compose

  - sudo mv ~/docker-compose /usr/local/bin/docker-compose

  - chmod +x /usr/local/bin/docker-compose

[Installation Guides](https://docs.docker.com/compose/install/)
