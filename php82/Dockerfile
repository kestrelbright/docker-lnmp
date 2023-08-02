FROM php:8.2.6-fpm-alpine
ENV TIMEZONE Asia/Shanghai
ENV PHP_INI_DIR=/usr/local/etc/php
ENV CFLAGS="$CFLAGS -D_GNU_SOURCE"
RUN set -eux;  mkdir -p "$PHP_INI_DIR/conf.d";  [ ! -d /usr/share/nginx/html ];  mkdir -p /usr/share/nginx/html;  chown www-data:www-data /usr/share/nginx/html;  chmod 777 /usr/share/nginx/html
RUN apk add --no-cache curl --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/
RUN apk add --no-cache linux-headers curl --repository https://dl-2.alpinelinux.org/alpine/edge/community/ fcgi libzip libzip-dev libpng-dev libjpeg-turbo-dev gettext-dev libmcrypt-dev libxml2-dev libxslt-dev libgcrypt-dev libwebp-dev postgresql-dev yaml-dev $PHPIZE_DEPS autoconf g++ imagemagick imagemagick-dev icu-dev freetype-dev \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && docker-php-ext-configure gd --with-freetype --with-webp --with-jpeg \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j4 bcmath gd gettext pdo_mysql mysqli pdo_pgsql pgsql shmop soap sockets opcache xsl zip intl \
    && apk del .phpize-deps

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    # Using a version of pickle.phar built from v0.6.0-18-g9c9e184
RUN wget -O /usr/local/bin/pickle "https://github.com/tobybellwood/SampleFiles/raw/master/pickle.phar" \
    && chmod +x /usr/local/bin/pickle
# RUN pickle install -n redis-5.3.2
# RUN pickle install -n xdebug-3.0.0
# RUN pickle install -n yaml --version-override=2.2.0
# Legacy PECL installs
RUN pecl channel-update pecl.php.net \
    && yes '' | pecl install -f apcu-5.1.21 \
    && yes '' | pecl install -f redis-5.3.5 \
    && yes '' | pecl install -f xdebug-3.2.1 \
    && yes '' | pecl install -f yaml-2.2.2 \
    && yes '' | pecl install -f swoole-5.0.3 \
    && yes '' | pecl install -f imagick-3.7.0 \
   && docker-php-ext-enable apcu redis xdebug yaml swoole imagick \
   && rm -rf /tmp/pear ~/.pearrc

WORKDIR /usr/share/nginx/html
EXPOSE 9007
CMD ["php-fpm"]
