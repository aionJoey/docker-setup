# DOCKER INSTALLATION

# May need to logout and login
# Enable user group
sudo usermod -a -G docker $USER

# Installing required dependencies
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Adding the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Installing docker
sudo apt-get update 
sudo apt-get install -y docker-ce
sudo docker run hello-world

