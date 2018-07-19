# docker-kernel setup

This repository contains the dockerized AION kernel setup files.

1. Run __docker_setup.sh__
```
./docker_setup.sh
```

2. Download docker-kernel
```
docker pull <user>/<repository>
```	

3. Setup default configurations
```
docker run -i -t <image>:<tag> /bin/bash
```

4. Execute docker-kernel
```
docker start -a -i <container>
```

** Missing JDK-10.0.1 - TOO LARGE FOR GIT **
