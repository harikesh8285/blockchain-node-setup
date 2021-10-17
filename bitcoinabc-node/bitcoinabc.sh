#!/bin/sh
BLOCKCHAIN="bitcoin-abc"
VERSION="0.24.3"
RPCUSER="username"
RPCPASSWORD="password"
SOURCE=wget https://download.bitcoinabc.org/$BLOCKCHAIN-$VERSION/linux/$BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
wget $SOURCE
tar -zxvf $BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
sudo install -m 0755 -o root -g root -t /usr/local/bin ~/$BLOCKCHAIN-$VERSION/bin/*
rm -rf ~/$BLOCKCHAIN-$VERSION/ $BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
sudo mkdir  ~/.bitcoin
sudo echo 'rpcuser=' ${RPCUSER} '\nrpcpassword='${RPCPASSWORD} '\ntxindex=1 \ntestnet=1 \nrpcallowip=127.0.0.1'>bitcoin.conf
sudo bitcoind -daemon