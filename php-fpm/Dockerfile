#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

ARG PHP_VERSION

FROM php:${PHP_VERSION}-fpm
#FROM laradock/php-fpm:latest-7.3
MAINTAINER ykq <379395979@qq.com>


# If you're in China, or you need to change sources, will be set CHANGE_SOURCE to true in .env.
ARG CHANGE_SOURCE=true
RUN if [ ${CHANGE_SOURCE} = true ]; then \
  # Change application source from deb.debian.org to aliyun source
  sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
  sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
  sed -i 's/security-cdn.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list \
  ;fi

# always run apt update when start and after add new source list, then clean up at end.
RUN set -xe; \
  apt-get update -yqq && \
  pecl channel-update pecl.php.net && \
  apt-get install -yqq \
  apt-utils \
  gnupg2 \
  ecl \
  git \
  #
  #--------------------------------------------------------------------------
  # Mandatory Software's Installation
  #--------------------------------------------------------------------------
  #
  # Mandatory Software's such as ("mcrypt", "pdo_mysql", "libssl-dev", ....)
  # are installed on the base image 'laradock/php-fpm' image. If you want
  # to add more Software's or remove existing one, you need to edit the
  # base image (https://github.com/Laradock/php-fpm).
  #
  # next lines are here becase there is no auto build on dockerhub see https://github.com/laradock/laradock/pull/1903#issuecomment-463142846
  libzip-dev zip unzip && \
  if [ ${LARADOCK_PHP_VERSION} = "7.3" ] || [ ${LARADOCK_PHP_VERSION} = "7.4" ] || [ $(php -r "echo PHP_MAJOR_VERSION;") = "8" ]; then \
  docker-php-ext-configure zip; \
  else \
  docker-php-ext-configure zip --with-libzip; \
  fi && \
  # Install the zip extension
  docker-php-ext-install zip && \
  php -m | grep -q 'zip'

run apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev 

#####################################
# Opcache:
#####################################

ARG INSTALL_OPCACHE=false
RUN if [ ${INSTALL_OPCACHE} = true ]; then \
  docker-php-ext-install opcache \
  ;fi


#####################################
# mysql:
#####################################


RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install gd
RUN docker-php-ext-enable gd
RUN docker-php-ext-install sockets
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install bcmath 
#RUN docker-php-ext-install event



# Install Redis package:
ARG INSTALL_REDIS=true
RUN if [ ${INSTALL_REDIS} = true ]; then \

  #Install Redis Extension
  pecl -vvv install -o -f redis \
  &&  rm -rf /tmp/pear \
  &&  docker-php-ext-enable redis \


  # mkdir -p /usr/src/php/ext/redis \
  # && curl -L https://github.com/phpredis/phpredis/archive/3.1.2.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
  # && echo 'redis' >> /usr/src/php-available-exts \
  # && docker-php-ext-install redis \

  ;fi






#####################################
# Check PHP version:
#####################################

#RUN php -v | head -n 1 | grep -q "PHP 7.3."

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#


# 复制
# ADD ./laravel.ini /usr/local/etc/php/conf.d
# ADD ./xlaravel.pool.conf /usr/local/etc/php-fpm.d/

#RUN rm -r /var/lib/apt/lists/*

#RUN usermod -u 1000 www


WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000
