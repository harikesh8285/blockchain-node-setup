#!/bin/sh
BLOCKCHAIN="bitcoin"
VERSION="0.21.1"
RPCUSER="username"
RPCPASSWORD="password"
SOURCE=https://bitcoincore.org/bin/$BLOCKCHAIN-core-$VERSION/$BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
wget $SOURCE
tar -zxvf $BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
sudo install -m 0755 -o root -g root -t /usr/local/bin ~/$BLOCKCHAIN-$VERSION/bin/*
rm -rf ~/$BLOCKCHAIN-$VERSION/ $BLOCKCHAIN-$VERSION-x86_64-linux-gnu.tar.gz
sudo mkdir  ~/.$BLOCKCHAIN
sudo echo 'rpcuser=' ${RPCUSER} '\nrpcpassword='${RPCPASSWORD} '\ntxindex=1 \ntestnet=1 \nrpcallowip=127.0.0.1'>$BLOCKCHAIN.conf
sudo bitcoind -daemon