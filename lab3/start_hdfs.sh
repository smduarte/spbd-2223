#!/bin/bash
#apt-get install -y openssh-server
#/etc/init.d/ssh start

HADOOP=hadoop-3.3.4
HADOOP_HOME=/usr/local/$HADOOP

cat > $HADOOP_HOME/etc/hadoop/core-site.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>
EOF
cat > $HADOOP_HOME/etc/hadoop/hdfs-site.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
EOF
#rm -f ~/.ssh/id_rsa ; ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
#cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
#chmod 0600 ~/.ssh/authorized_keys

$HADOOP_HOME/bin/hdfs namenode -format

export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export YARN_NODEMANAGER_USER="root"

cat > $HADOOP_HOME/sbin/start-dfs.sh << EOF
#!/usr/bin/env bash

HADOOP=hadoop-3.3.4
HADOOP_HOME=/usr/local/$HADOOP
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

echo "starting dfs daemons"

hadoop-daemon.sh --config $HADOOP_HOME/etc/hadoop/ start namenode
hadoop-daemon.sh --config $HADOOP_HOME/etc/hadoop/ start secondarynamenode
hadoop-daemon.sh --config $HADOOP_HOME/etc/hadoop/ start datanode

EOF
