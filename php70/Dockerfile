# 拉取ubuntu18.04
FROM ubuntu:18.04

# 维护者
MAINTAINER kestrelBright <xuhupeng@gmail.com>
# Set correct environment variables.
ENV HOME /home
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8

RUN set -eux; \
    apt-get update && apt-get install -y --no-install-recommends locales apt-file software-properties-common vim libboost-all-dev gcc-4.8; \
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php; \
    apt-get update -y; \
    apt-get install -y --no-install-recommends curl wget openssl php7.0 php7.0-bcmath php7.0-cli php7.0-cgi php7.0-common php7.0-dev php7.0-xdebug php7.0-apcu php7.0-geoip php7.0-fpm php7.0-json php7.0-memcached php7.0-memcache php7.0-mysql php7.0-pgsql php7.0-mongo php7.0-sqlite php7.0-sybase php7.0-interbase php7.0-odbc php7.0-ldap php7.0-gmp php7.0-intl php7.0-imagick php7.0-gd php7.0-imap php7.0-curl php7.0-oauth php7.0-redis php7.0-enchant php7.0-xml php7.0-xmlrpc php7.0-tidy php7.0-recode php7.0-readline php7.0-zip php7.0-pspell php7.0-mbstring php7.0-mcrypt; \
    curl https://getcomposer.org/installer | php -- && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer; \
    apt-get -y autoremove; \
    apt-get clean; \
    apt-get autoclean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
    mkdir -p /usr/share/nginx/html && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


# Allow mounting files
VOLUME ["/usr/share/nginx/html"]
# Set the work directory
WORKDIR /usr/share/nginx/html
CMD ["php-fpm7.0", "-F"]
EXPOSE 9002
