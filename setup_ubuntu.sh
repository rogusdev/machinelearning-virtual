#!/usr/bin/env bash

# Enable truly non interactive apt-get installs
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get upgrade -yq
sudo apt-get autoremove -yq

echo -e "\ncd /vagrant" >> ~/.bashrc  # ubuntu

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo curl -L https://raw.githubusercontent.com/docker/compose/1.22.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

sudo apt-get update
sudo apt-get install -y make docker-ce

sudo usermod -a -G docker $USER

# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl libncurses5-dev xz-utils libxml2-dev libxmlsec1-dev libffi-dev
# tk-dev llvm

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.3
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# https://www.python.org/downloads/
asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
asdf install python 2.7.15
asdf install python 3.7.2
asdf global python 3.7.2 2.7.15

pip install --upgrade pip awscli
pip install --upgrade numpy scipy pandas matplotlib scikit-learn
# https://github.com/asdf-vm/asdf/issues/107
asdf reshim python

docker --version
docker-compose --version
python --version
pip --version
