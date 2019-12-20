FROM ubuntu:bionic

EXPOSE 8080
ENV CNB_USER_ID=33
ENV CNB_GROUP_ID=33
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq -y update && \
    apt-get -qq -y install wget curl git gnupg procps less vim msmtp mysql-client xz-utils ca-certificates sqlite php-apcu php-apcu-bc php-fpm php-curl php-cgi php-cli php-common php-fpm php-gd php-json php-ldap php-mysql php-mbstring php-intl php-sqlite3 php-xml php-xmlrpc php-opcache php-soap php-readline php-zip && \
    apt-get -qq -y autoremove && apt-get -qq -y clean && rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/sbin/php-fpm7.2 /usr/sbin/php-fpm
