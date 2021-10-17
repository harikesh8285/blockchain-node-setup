#!/bin/sh
BLOCKCHAIN="viacoin"
VERSION="0.15.2"
RPCUSER="username"
RPCPASSWORD="password"
SOURCE=https://github.com/$BLOCKCHAIN/$BLOCKCHAIN/releases/download/v$VERSION/$BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz

wget $SOURCE
tar -zxvf $BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
sudo install -m 0755 -o root -g root -t /usr/local/bin ~/$BLOCKCHAIN-$VERSION/bin/*
rm -rf ~/$BLOCKCHAIN-$VERSION/ $BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
sudo mkdir  ~/.$BLOCKCHAIN
sudo echo 'rpcuser=' ${RPCUSER} '\nrpcpassword='${RPCPASSWORD} '\ntxindex=1 \ntestnet=1 \nrpcallowip=127.0.0.1'>$BLOCKCHAIN.conf
sudo viacoind -daemon