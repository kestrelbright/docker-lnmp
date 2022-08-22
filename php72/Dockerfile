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

# Need to generate our locale.
RUN set -eux; \
    apt-get update && apt-get install -y --no-install-recommends locales apt-file software-properties-common vim libboost-all-dev gcc-4.8; \
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php; \
    apt-get update -y; \
    apt-get install -y --no-install-recommends curl wget openssl php7.2 php7.2-bcmath php7.2-cli php7.2-cgi php7.2-common php7.2-dev php7.2-apcu php7.2-geoip php7.2-fpm php7.2-json php7.2-memcached php7.2-memcache php7.2-mysql php7.2-pgsql php7.2-mongo php7.2-sqlite php7.2-sybase php7.2-interbase php7.2-odbc php7.2-ldap php7.2-gmp php7.2-intl php7.2-imagick php7.2-gd php7.2-imap php7.2-curl php7.2-oauth php7.2-redis php7.2-enchant php7.2-xml php7.2-xmlrpc php7.2-tidy php7.2-recode php7.2-readline php7.2-zip php7.2-pspell php7.2-mbstring php7.2-swoole  php7.2-mcrypt php7.2-xdebug; \
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
CMD ["php-fpm7.2", "-F"]
EXPOSE 9003
