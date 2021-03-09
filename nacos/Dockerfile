FROM openjdk:8-jre

WORKDIR /usr/

COPY nacos-server-1.4.1.zip /usr/nacos-server-1.4.1.zip
#RUN wget https://github.com/alibaba/nacos/releases/download/1.4.1/nacos-server-1.4.1.zip

RUN unzip nacos-server-1.4.1.zip
RUN rm nacos-server-1.4.1.zip

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod u+x /docker-entrypoint.sh

EXPOSE 8848

# tomcat访问 路径需要加上上传的文件名

ENTRYPOINT ["/docker-entrypoint.sh"]
