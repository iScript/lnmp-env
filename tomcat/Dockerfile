FROM openjdk:8-jre

WORKDIR /usr/

RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.59/bin/apache-tomcat-8.5.59.zip 
RUN unzip apache-tomcat-8.5.59.zip 
RUN rm apache-tomcat-8.5.59.zip

RUN chmod u+x /usr/apache-tomcat-8.5.59/bin/*.sh

EXPOSE 8080

# tomcat访问 路径需要加上上传的文件名

ENTRYPOINT ["/usr/apache-tomcat-8.5.59/bin/catalina.sh","run"]
