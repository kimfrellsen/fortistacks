#!/bin/bash -e

ctx logger info "Installing AntMedia"
ctx logger debug "${COMMAND}"

sudo apt-get update
sudo apt-get -y install wget
# src: https://github.com/ant-media/Ant-Media-Server/blob/master/doc/Getting_Started.md

# create a temporary directory and cd to it.
TMPDIR=`mktemp -d`
cd $TMPDIR
ctx logger info "Download package"
wget https://github.com/ant-media/Ant-Media-Server/releases/download/ams-v1.4.1/ant-media-server-community-1.4.1-180813_1533.zip
ctx logger info "Install as a service"
wget https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh
chmod 755 install_ant-media-server.sh
sudo ./install_ant-media-server.sh ant-media-server-community-1.4.1-180813_1533.zip
sudo service antmedia status
#clean once done
rm -rf $TMPDIR
ctx logger info "Installed and Started Antmedia"