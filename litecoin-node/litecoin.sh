#!/bin/sh
BLOCKCHAIN="litecoin"
VERSION="0.18.1"
RPCUSER="username"
RPCPASSWORD="password"
SOURCE=https://download.litecoin.org/$BLOCKCHAIN-$VERSION/linux/$BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
wget $SOURCE
tar -zxvf $BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
sudo install -m 0755 -o root -g root -t /usr/local/bin ~/$BLOCKCHAIN-$VERSION/bin/*
rm -rf ~/$BLOCKCHAIN-$VERSION/ $BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
sudo mkdir  ~/.$BLOCKCHAIN
sudo echo 'rpcuser=' ${RPCUSER} '\nrpcpassword='${RPCPASSWORD} '\ntxindex=1 \ntestnet=1 \nrpcallowip=127.0.0.1'>$BLOCKCHAIN.conf
sudo litecoind -daemon