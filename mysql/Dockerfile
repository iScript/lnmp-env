#ARG MYSQL_VERSION=latest
#FROM mysql/mysql-server:5.7
FROM mysql/mysql-server:8.0
#####################################
# Set Timezone
#####################################

# ARG TZ=UTC
# ENV TZ ${TZ}
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN chown -R mysql:root /var/lib/mysql/

ADD my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306
