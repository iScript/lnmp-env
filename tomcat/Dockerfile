FROM openjdk:8-jre

WORKDIR /usr/

RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.63/bin/apache-tomcat-8.5.63.zip

RUN unzip apache-tomcat-8.5.63.zip 
RUN rm apache-tomcat-8.5.63.zip
RUN chmod u+x /usr/apache-tomcat-8.5.63/bin/*.sh

ADD server.xml /usr/apache-tomcat-8.5.63/conf/

EXPOSE 8081

# tomcat访问 路径需要加上上传的文件名

ENTRYPOINT ["/usr/apache-tomcat-8.5.63/bin/catalina.sh","run"]
