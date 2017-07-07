#!/bin/bash
# instGlobal.sh
 
echo "instGlobal.sh ...."
 
echo "install package for GNU global..."
sudo apt-get update
sudo apt-get -y install curl
sudo apt-get -y install wget
sudo apt-get -y install ncurses-dev
sudo apt-get -y install exuberant-ctags
 
sudo apt-get -y install python
 
CUR=`pwd`
echo "install GNU global..."
wget http://tamacom.com/global/global-6.4.tar.gz
tar zxvf global-6.4.tar.gz
cd global-6.4
./configure
make
sudo make install
cd $CUR
 
echo "install pip..."
curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python
 
 
echo "install pygments..."
sudo pip install pygments==1.6
 
rm -rf global-6.4*

echo "$0 done."
exit 0
