FROM alpine

RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/' /etc/apk/repositories;

RUN apk update; \
    apk add --no-cache \
        git openssh supervisor openrc tzdata \
        nginx nodejs nodejs-npm \
        glib libxrender \
        ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apk add --no-cache \
        php7-bcmath \
        php7-cli \
        php7-common \
        php7-curl \
        php7-dev \
        php7-dom \
        php7-fileinfo \
        php7-fpm \
        php7-gd \
        php7-gmp \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mysqli \
        php7-mysqlnd \
        php7-opcache \
        php7-pdo_mysql \
        php7-phar \
        php7-redis \
        php7-simplexml \
        php7-tokenizer \
        php7-xdebug \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip; \
    rm -rf /tmp/* /var/cache/apk/*

RUN mkdir -p /etc/supervisor.d /run/nginx

COPY conf/supervisord.ini /etc/supervisor.d/supervisord.ini

RUN sed -i 's/\r$//' /etc/supervisor.d/supervisord.ini

COPY wkhtmltopdf /usr/local/bin/

RUN chmod +x /usr/local/bin/wkhtmltopdf

COPY fonts/* /usr/share/fonts/

RUN wget -qO- https://getcomposer.org/installer | php; \
    mv composer.phar /usr/local/bin/composer;

ARG COMPOSER_REPO_PACKAGIST
ENV COMPOSER_REPO_PACKAGIST ${COMPOSER_REPO_PACKAGIST}

RUN if [ ${COMPOSER_REPO_PACKAGIST} ]; then \
    composer config -g repo.packagist composer ${COMPOSER_REPO_PACKAGIST} \
;fi

RUN composer global require "hirak/prestissimo";

ARG NPM_REGISTRY
ENV NPM_REGISTRY ${NPM_REGISTRY}

RUN if [ ${NPM_REGISTRY} ]; then \
    npm config set registry ${NPM_REGISTRY} \
;fi

RUN npm install apidoc -g

RUN ssh-keygen -A

RUN sed -i 's/#PasswordAuthentication\ yes/PasswordAuthentication\ no/' /etc/ssh/sshd_config; \
    sed -i 's/#ChallengeResponseAuthentication\ yes/ChallengeResponseAuthentication\ no/' /etc/ssh/sshd_config;

COPY insecure_id_rsa /tmp/id_rsa
COPY insecure_id_rsa.pub /tmp/id_rsa.pub

RUN mkdir /root/.ssh; \
    cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys; \
    cat /tmp/id_rsa.pub >> ~/.ssh/id_rsa.pub; \
    cat /tmp/id_rsa >> ~/.ssh/id_rsa; \
    rm -f /tmp/id_rsa*; \
    chmod 600 ~/.ssh/authorized_keys ~/.ssh/id_rsa.pub; \
    chmod 400 ~/.ssh/id_rsa;

EXPOSE 22 80

CMD ["supervisord"]