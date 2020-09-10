FROM ubuntu:18.04

RUN apt-get update -y && apt-get install vim -y && apt-get install wget -y && apt-get install ssh -y && apt-get install openjdk-8-jdk -y && apt-get install sudo -y

# chpasswd 从系统的标准输入读入用户的名称和口令，并利用这些信息来更新系统上已存在的用户的口令
# adduser 添加sudo权限 NOPASSWD sudo无需输入密码
RUN useradd -m hduser && echo "hduser:supergroup" | chpasswd && adduser hduser sudo && echo "hduser     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && cd /usr/bin/ && sudo ln -s python3 python





# 切换工作目录和用户
WORKDIR /home/hduser
USER hduser


RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz && tar zxvf hadoop-3.3.0.tar.gz && rm hadoop-3.3.0.tar.gz
# ssh 免密码登陆 , 单节点则自己登陆自己
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys

ENV HDFS_NAMENODE_USER hduser
ENV HDFS_DATANODE_USER hduser
ENV HDFS_SECONDARYNAMENODE_USER hduser
ENV YARN_RESOURCEMANAGER_USER hduser
ENV YARN_NODEMANAGER_USER hduser

ENV HADOOP_HOME /home/hduser/hadoop-3.3.0
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh

COPY core-site.xml $HADOOP_HOME/etc/hadoop/
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY mapred-site.xml $HADOOP_HOME/etc/hadoop/
COPY yarn-site.xml $HADOOP_HOME/etc/hadoop/


COPY docker-entrypoint.sh $HADOOP_HOME/etc/hadoop/

ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# namenode
EXPOSE 8020 9000 
# datanode
EXPOSE 9864 9866 9870  
#mapreduce
EXPOSE 10020 19888
#YARN
EXPOSE 8088 8040 8042 8030 8031 8032 8033 
# 其他
EXPOSE 22 50070 50075 50010 50020 50090

# 设置容器启动时要执行的命令及其参数
ENTRYPOINT ["/home/hduser/hadoop-3.3.0/etc/hadoop/docker-entrypoint.sh"]

# COPY mysql-connector-java-5.1.48.jar /home/hduser
# COPY hive-site.xml /home/hduser
# #COPY apache-hive-3.1.2-bin.tar.gz /home/hduser
# ARG INSTALL_HIVE=true
# RUN if [ ${INSTALL_HIVE} = true ]; then \
#     wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz && \
#     tar zxvf apache-hive-3.1.2-bin.tar.gz && rm apache-hive-3.1.2-bin.tar.gz && \
#     export HIVE_HOME=/home/hduser/apache-hive-3.1.2-bin && export PATH=$HIVE_HOME/bin:$PATH && \
#     rm $HIVE_HOME/lib/guava-19.0.jar && cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib/ &&   \
#     mv /home/hduser/mysql-connector-java-5.1.48.jar $HIVE_HOME/lib/ && mv /home/hduser/hive-site.xml $HIVE_HOME/conf/ &&  \
#     # 要启动后才能执行？
#     # $HADOOP_HOME/bin/hadoop fs -mkdir /tmp && $HADOOP_HOME/bin/hadoop fs -mkdir -p /user/hive/warehouse && $HADOOP_HOME/bin/hadoop fs -chmod g+w   /tmp && $HADOOP_HOME/bin/hadoop fs -chmod g+w   /user/hive/warehouse && \
#     # 。。。
#     # $HIVE_HOME/bin/schematool -dbType mysql -initSchema
#     # $HIVE_HOME/bin/hive
#     ls \
# ;fi

