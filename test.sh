# Original by Tero Karvinen http://TeroKarvinen.com GPL 3
# GitHub: https://github.com/terokarvinen/sirotin/blob/master/run.sh

#!/bin/bash

setxkbmap fi
sudo apt-get update
sudo apt-get -y install git salt-minion


echo 'master: localhost'|sudo tee /etc/salt/minion

git clone https://github.com/Vipa94/Module
cd Module/
bash module.sh
