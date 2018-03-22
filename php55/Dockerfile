# 拉取ubuntu14.04
FROM daocloud.io/library/ubuntu:14.04

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
RUN add-apt-repository ppa:ondrej/php

# Install and Test PHP
RUN apt-get install --no-install-recommends -y \
		curl ca-certificates \
		php5-cli \
		php5-dev \
		php5-xdebug \
		php5-apcu \
		php5-geoip \
		php5-fpm \
		php5-json \
		php5-memcached php5-memcache \
		php5-mysql php5-pgsql \
		php5-mongo \
		php5-sqlite php5-sybase php5-interbase php5-odbc \
		php5-gearman \
		php5-mcrypt  \
		php5-ldap \
		php5-gmp  \
		php5-intl \
		php5-imagick php5-gd \
		php5-imap \
		php5-curl \
		php5-oauth \
		php5-redis \
		php5-enchant \
		php5-xsl \
		php5-xmlrpc \
		php5-tidy \
		php5-recode \
		php5-readline \
		php5-pspell && \

		php --version && \
		php -m
		
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
CMD ["php5-fpm", "-F"]
EXPOSE 9000
