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
    apt-get install -y --no-install-recommends curl wget openssl php5.6 php5.6-cli php5.6-cgi php5.6-common php5.6-dev php5.6-xdebug php5.6-apcu php5.6-geoip php5.6-fpm php5.6-json php5.6-memcached php5.6-memcache php5.6-mysql php5.6-pgsql php5.6-mongo php5.6-sqlite php5.6-sybase php5.6-interbase php5.6-odbc php5.6-mcrypt php5.6-ldap php5.6-gmp php5.6-intl php5.6-imagick php5.6-gd php5.6-imap php5.6-curl php5.6-oauth php5.6-redis php5.6-enchant php5.6-xml php5.6-xmlrpc php5.6-tidy php5.6-recode php5.6-readline php5.6-zip php5.6-pspell php5.6-mbstring php5.6-bcmath; \
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
CMD ["php-fpm5.6", "-F"]
EXPOSE 9001
