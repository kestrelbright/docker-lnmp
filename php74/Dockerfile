FROM php:7.4-fpm-alpine3.13

ENV TIMEZONE Asia/Shanghai

ENV PHP_MEMORY_LIMIT 512M

ENV MAX_UPLOAD 50M

ENV PHP_MAX_FILE_UPLOAD 200

ENV PHP_MAX_POST 100M

## swoole版本，如需安装swoole则取消注释

#ENV PHP_EXT_SWOOLE=swoole-2.0.6

#基础依赖

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \

  apk update && \

  apk add --no-cache tzdata curl zip libzip-dev && \

  cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \

  echo "${TIMEZONE}" > /etc/timezone && \

  apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \

    php7-common php7-intl php7-gd php7-mcrypt php7-openssl \

    php7-gmp php7-json php7-dom php7-pdo php7-zip \

    php7-zlib php7-mysqli php7-bcmath php7-pdo_mysql php7-pgsql \

    php7-pdo_pgsql php7-gettext \

    php7-bz2 php7-iconv php7-curl php7-ctype php7-fpm \

    php7-mbstring php7-session php7-phar curl curl-dev postgresql-dev \

    ## 如果使用swoole  需要取消下行注释

    #hiredis-dev libmcrypt-dev gmp-dev icu-dev linux-headers musl --virtual .phpize-deps $PHPIZE_DEPS \

    tzdata && \

    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \

    php composer-setup.php && \

    php -r "unlink('composer-setup.php');" && \

    mv composer.phar /usr/local/bin/composer && \

    composer self-update && \

    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php7/php-fpm.conf && \

    sed -i -e "s/listen\s*=\s*127.0.0.1:9004/listen = 9004/g" /etc/php7/php-fpm.d/www.conf && \

    sed -i "s|;date.timezone =.*|date.timezone = ${TIMEZONE}|" /etc/php7/php.ini && \

    mkdir -p /usr/src/php/ext/redis && \

    curl -L https://github.com/phpredis/phpredis/archive/refs/tags/3.1.4.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 && \

    echo 'redis' >> /usr/src/php-available-exts && \
    
    docker-php-ext-install redis pgsql pdo pdo_mysql pdo_pgsql zip && \

      rm -rf /var/cache/apk/*

# 如需安装swoole，取消以下注释

#RUN \
#cd /tmp \
#&& pecl download $PHP_EXT_SWOOLE \
#&& mkdir -p /tmp/$PHP_EXT_SWOOLE \
#&& tar -xf ${PHP_EXT_SWOOLE}.tgz -C /tmp/$PHP_EXT_SWOOLE --strip-components=1 \
#&& docker-php-ext-configure /tmp/$PHP_EXT_SWOOLE --enable-async-redis --enable-openssl --enable-sockets=/usr/local/include/php/ext/sockets \
#&& docker-php-ext-install /tmp/$PHP_EXT_SWOOLE \
#&& rm -rf /tmp/${PHP_EXT_SWOOLE}*




# 放入自己需要的代码
RUN wget http://xdebug.org/files/xdebug-3.0.4.tgz && tar zxvf xdebug-3.0.4.tgz && mv xdebug-3.0.4 /usr/src/php/ext/xdebug && rm -f xdebug-3.0.4.tgz
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN /usr/local/bin/docker-php-ext-install xdebug \
        && /usr/local/bin/docker-php-ext-enable xdebug

RUN mkdir -p /usr/share/nginx/html
#RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
# 安装composer依赖

#RUN composer install

WORKDIR /usr/share/nginx/html
VOLUME ["/usr/share/nginx/html"]
# php-fpm使用以下配置
CMD ["/bin/sh"]
CMD ["php-fpm"]
EXPOSE 9004
# swoole 使用以下配置

#EXPOSE 9501

# 启动swoole server

#CMD ["php","src/server","start"]
