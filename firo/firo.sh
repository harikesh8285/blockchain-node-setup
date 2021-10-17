#!/bin/sh
BLOCKCHAIN="firo"
VERSION="0.14.9"
RPCUSER="username"
RPCPASSWORD="password"
SOURCE=https://downloads.sourceforge.net/project/firoorg/$BLOCKCHAIN-$VERSION.0-linux64.tar.gz
wget $SOURCE
tar -zxvf $BLOCKCHAIN-$VERSION.0-linux64.tar.gz
sudo install -m 0755 -o root -g root -t /usr/local/bin ~/$BLOCKCHAIN-$VERSION/bin/*
rm -rf ~/$BLOCKCHAIN-$VERSION/ $BLOCKCHAIN-$VERSION.0-linux64.tar.gz
sudo mkdir  ~/.$BLOCKCHAIN
sudo echo 'rpcuser=' ${RPCUSER} '\nrpcpassword='${RPCPASSWORD} '\ntxindex=1 \ntestnet=1 \nrpcallowip=127.0.0.1'>$BLOCKCHAIN.conf
sudo firod -daemon