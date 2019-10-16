ARG base_image
FROM ${base_image}
ARG stack_id
LABEL io.buildpacks.stack.id="${stack_id}"
ENV NGINX_VERSION=1.15.0

RUN curl -O -s http://nginx.org/keys/nginx_signing.key && \
    apt-key add nginx_signing.key && rm nginx_signing.key && \
    echo "deb http://nginx.org/packages/mainline/ubuntu/ bionic nginx" > /etc/apt/sources.list.d/nginx.list && \
    apt-get -qq -y update && apt-get -qq -y install nginx-module-perl=${NGINX_VERSION}* nginx=${NGINX_VERSION}* && \
    apt-get -qq -y clean && rm -rf /var/lib/apt/lists/* && apt-get -qq autoremove -y \
    && echo "$(nginx -V 2>&1 | grep -oP "modules-path=\K[^\s]*")"

RUN mkdir -p /etc/nginx/sites-enabled /var/log/nginx /var/cache/nginx/client_temp /var/www /run/php \
    && touch /var/log/nginx/access.log \
    && touch /var/log/nginx/error.log \
    && touch /etc/nginx/nginx.conf \
    && ln -s /workspace /var/www/html \
    && chown -R www-data:www-data /var/www /var/cache/nginx /var/log/nginx /etc/nginx/sites-enabled /run \
    && chmod -R 755 /var/www /etc/nginx/sites-enabled \
    && chmod -R 766 /var/cache/nginx /var/log/nginx \
    && chmod 744 /etc/nginx/nginx.conf

USER www-data
