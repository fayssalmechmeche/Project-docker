FROM alpine:3.19

RUN apk add curl git

# PHP et les extensions obligatoires pour Symfony
# https://symfony.com/doc/current/setup.html
RUN apk add php82 php82-ctype php82-iconv pcre2 php82-session php82-simplexml php82-tokenizer

# Dépendances supplémentaires pour Symfony (Doctrine, etc.)
RUN apk add php82-mbstring php82-posix php82-intl php82-fpm php82-pdo

# Dépendances pour Composer
RUN apk add php82-phar php82-openssl php82-xml php82-dom

RUN curl 'https://getcomposer.org/installer' | php

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | /bin/sh

RUN apk add symfony-cli

# Vérifie que toutes les dépendances nécessaires sont installées
RUN symfony check:requirements

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN php composer.phar create-project symfony/skeleton app
RUN mv composer.phar app

WORKDIR app

RUN php composer.phar require webapp

CMD symfony server:start

