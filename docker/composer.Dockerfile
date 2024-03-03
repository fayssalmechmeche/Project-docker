FROM alpine:3.19

RUN apk update && apk upgrade

# Installe les dépendances de base de PHP
RUN apk add php82 php82-phar php82-iconv php82-openssl php82-ctype php82-xml php82-dom php82-tokenizer php82-mbstring php82-session php82-simplexml

# Télécharge le script d'installation de Composer.
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# Exécute le script d'installation de Composer.
RUN php composer-setup.php

# Supprime le script d'installation de Composer après son exécution.
RUN php -r "unlink('composer-setup.php');"

# Déplace le fichier exécutable Composer (composer.phar) dans le répertoire /usr/local/bin/, ce qui permet de l'exécuter globalement sur le système.
RUN mv composer.phar /usr/local/bin/composer

# Définir le répertoire de travail
WORKDIR /app

ENTRYPOINT [ "composer" ]

