#!/usr/bin/env bash

# host
echo 127.0.0.1 localhost | sudo tee -a /etc/hosts
echo 127.0.0.1 dev | sudo tee -a /etc/hosts

# 时区
sudo timedatectl set-timezone Asia/Shanghai
sudo locale-gen zh_CN.UTF-8

# 阿里源
cd /etc/apt/
sudo mv sources.list sources.list.bak
sudo cp /vagrant/sources.list.mirror /etc/apt/sources.list

sudo apt-get update -y
sudo apt-get upgrade -y

# 安装 python 运行环境
sudo apt-get install -y python-pip python-dev build-essential
sudo apt-get install -y python3
sudo apt-get install -y python3-pip

# 安装nginx和git
sudo apt-get update -y
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev
sudo apt-get install -y nginx git redis mongodb

# 安装mysql
# sudo wget https://repo.percona.com/apt/percona-release_0.1-6.$(lsb_release -sc)_all.deb
# sudo dpkg -i percona-release_0.1-6.$(lsb_release -sc)_all.deb
# sudo apt-get update -y
# sudo apt-get install -y percona-server-server-5.7

# python 环境
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2

pip3 install virtualenv
pip3 install virtualenvwrapper

mkdir $HOME/.virtualenvs

echo 'export WORKON_HOME=$HOME/.virtualenvs' >> $HOME/.bashrc
echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> $HOME/.bashrc
echo 'export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv' >> $HOME/.bashrc
echo 'source $HOME/.local/bin/virtualenvwrapper.sh' >> $HOME/.bashrc
source $HOME/.bashrc

echo 'DONE!'