# docker-kernel setup

This repository contains the dockerized AION kernel setup files.

1. Run __docker_setup.sh__
```
./docker_setup.sh
```

2. Download custom docker-kernel
```
docker pull <user>/<repository>
```	

3. Setup new configuration (creates a new container)
```
docker run -i -t <image>:<tag> /bin/bash
```

4. Setup kernel with CLI (creates a new container)
```
docker run -i -t <image>:<tag> ./aion.sh [ARG]
```

5. Execute existing container
```
docker start -i -a <container>
```
