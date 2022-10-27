#!/bin/bash
#apt-get install -y openssh-server
#/etc/init.d/ssh start

echo "export JAVA_HOME="`readlink -f /usr/bin/java | sed "s:bin/java::"`

export PIG_HOME=/opt/pig-0.17.0
mkdir -p $PIG_HOME
cd /opt/
wget -O /tmp/pig.tgz https://dlcdn.apache.org/pig/latest/pig-0.17.0.tar.gz
tar xfz /tmp/pig.tgz