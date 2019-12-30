FROM ubuntu:bionic

EXPOSE 8080
ENV CNB_USER_ID=33
ENV CNB_GROUP_ID=33
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq -y update && \
    apt-get -qq -y install software-properties-common wget curl git gnupg procps less vim msmtp mysql-client xz-utils ca-certificates sqlite && \
    add-apt-repository ppa:ondrej/php && \
    apt-get -qq -y update && \
    apt-get -qq -y install php7.3-fpm php7.3-curl php7.3-cgi php7.3-cli php7.3-common php7.3-fpm php7.3-gd php7.3-json php7.3-ldap php7.3-mysql php7.3-mbstring php7.3-xml php7.3-xmlrpc php7.3-sqlite3 php7.3-intl php7.3-opcache php7.3-soap php7.3-readline php7.3-zip php-apcu php-apcu-bc && \
    apt-get -qq -y autoremove && apt-get -qq -y clean && rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/sbin/php-fpm7.3 /usr/sbin/php-fpm
