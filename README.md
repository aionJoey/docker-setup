# docker-kernel setup

This repository contains the dockerized AION kernel setup files.

1. Run 'docker_setup.sh'
'''
./docker_setup.sh
'''

2. Download docker-kernel
'''
docker pull _user_/_repository_
'''

3. Setup default configurations
'''
docker run -i -t _image_:_tag_ /bin/bash
'''

4. Execute docker-kernel
'''
docker start -a -i _container_
