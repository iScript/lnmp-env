#!/bin/bash

# hadoop运行必须安装ssh无密码登陆，主从通信
sudo service ssh start

# 第一次启动要格式化文件系统，不要重复执行
if [ ! -d "/tmp/hadoop-hduser/dfs/name" ]; then
        $HADOOP_HOME/bin/hdfs namenode -format
fi

$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

# 防止docker自动退出
bash