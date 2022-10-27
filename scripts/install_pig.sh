#!/bin/bash
#apt-get install -y openssh-server
#/etc/init.d/ssh start

HADOOP=hadoop-3.3.4
HADOOP_HOME=/usr/local/$HADOOP

curl -s https://raw.githubusercontent.com/smduarte/spbd-2223/main/scripts/install_hadoop.sh | bash
export PIG_HOME=/opt/pig-0.17.0
mkdir -p $PIG_HOME
cd /opt/
wget -O /tmp/pig.tgz https://dlcdn.apache.org/pig/latest/pig-0.17.0.tar.gz
tar xfz /tmp/pig.tgz