FROM alpine:3.10

ENV SPARK_VERSION=3.0.0
ENV HADOOP_VERSION=3.2

RUN apk add --no-cache curl bash openjdk8-jre python3 py-pip nss libc6-compat \
    && wget https://www.apache.org/dyn/closer.lua/spark/spark-3.0.0/spark-3.0.0-bin-hadoop3.2.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    #&& cd /css \
    #&& jar uf /spark/jars/spark-core_2.11-${SPARK_VERSION}.jar org/apache/spark/ui/static/timeline-view.css \
    && cd /