FROM alpine:3.10

ENV SPARK_VERSION=3.0.1
ENV HADOOP_VERSION=3.2

ARG CHANGE_SOURCE=true
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    # Change application source from dl-cdn.alpinelinux.org to aliyun source
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi


RUN apk update \
    && apk upgrade \ 
    && apk add --no-cache bash curl openjdk8-jre python3 py-pip nss libc6-compat openssh \
    && wget https://mirror.bit.edu.cn/apache/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    #&& cd /css \
    #&& jar uf /spark/jars/spark-core_2.11-${SPARK_VERSION}.jar org/apache/spark/ui/static/timeline-view.css \
    && cd /

# 仅限alpine？
RUN apk add --no-cache coreutils procps

RUN sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \ 
    echo "root:admin" | chpasswd

# ssh 免密码登陆 , 单节点则自己登陆自己
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys

ENV SPARK_HOME /spark
ENV PATH $PATH:$SPARK_HOME/bin

COPY docker-entrypoint.sh /var/
COPY spark-env.sh $SPARK_HOME/conf/

# webui
EXPOSE 4040 8080 7077 

ENTRYPOINT ["/var/docker-entrypoint.sh"]                                                                                                

# 
# spark-shell --master lacal[2]
# create table t(key string,value string)
