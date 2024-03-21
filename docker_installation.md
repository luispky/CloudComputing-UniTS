# Uninstalling

## Uninstalling Docker

### Uninstall Docker Packages

`sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras`

### Remove Docker Data

`sudo rm -rf /var/lib/docker`
`sudo rm -rf /var/lib/containerd`


## Uninstalling Docker Compose

### If Docker Compose was installed as a CLI plugin: You can remove it by running:

`sudo apt-get remove docker-compose-plugin`

### If Docker Compose was manually installed

`sudo rm /usr/local/bin/docker-compose`

### If Docker Compose was installed using PIP

`pip uninstall docker-compose`

# Installing

## Installing Docker

1. **Update your package list**:
   ```bash
   sudo apt-get update
   ```

2. **Install Docker and Docker Compose**:
   ```bash
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
   ```
   This command installs Docker Engine, Docker CLI, containerd, and the Docker Compose plugin.