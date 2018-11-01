# 拉取ubuntu16.04
FROM daocloud.io/library/ubuntu:16.04

# 维护者
MAINTAINER kestrelBright <xuhupeng@gmail.com>
# Set correct environment variables.
ENV HOME /home
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update \
    && apt-get install -y apt-file \
    && apt-file update \
    && apt-get install -y software-properties-common \
    && apt-get install -y vim \
    && apt-get install -y locales

# Need to generate our locale.
RUN locale-gen en_US.utf8
ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8
RUN add-apt-repository ppa:ondrej/php -y \
    && apt-get update -y && apt-get install -y curl wget openssl php7.2 php7.2-bcmath php7.2-cli php7.2-cgi php7.2-common php7.2-dev php7.2-xdebug php7.2-apcu php7.2-geoip php7.2-fpm php7.2-json php7.2-memcached php7.2-memcache php7.2-mysql php7.2-pgsql php7.2-mongo php7.2-sqlite php7.2-sybase php7.2-interbase php7.2-odbc php7.2-ldap php7.2-gmp php7.2-intl php7.2-imagick php7.2-gd php7.2-imap php7.2-curl php7.2-oauth php7.2-redis php7.2-enchant php7.2-xml php7.2-xmlrpc php7.2-tidy php7.2-recode php7.2-readline php7.2-zip php7.2-pspell php7.2-mbstring
		
# Tidy up
RUN apt-get -y autoremove && apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install composer
RUN curl https://getcomposer.org/installer | php -- && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

RUN mkdir -p /usr/share/nginx/html

# Allow mounting files
VOLUME ["/usr/share/nginx/html"]
# Set the work directory
WORKDIR /usr/share/nginx/html
CMD ["php-fpm7.2", "-F"]
EXPOSE 9002
