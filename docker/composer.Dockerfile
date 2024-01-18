FROM alpine:3.19

RUN apk update && apk upgrade
# Installe les dépendances de base de PHP
RUN apk add php82 php82-phar php82-iconv php82-openssl php82-ctype php82-xml php82-dom php82-tokenizer php82-mbstring php82-session php82-simplexml
# Télécharge le script d'installation de Composer.
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# Utilise PHP en ligne de commande pour vérifier l'intégrité du script téléchargé en comparant sa somme de contrôle avec une valeur précalculée.
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# Exécute le script d'installation de Composer.
RUN php composer-setup.php
# Supprime le script d'installation de Composer après son exécution.
RUN php -r "unlink('composer-setup.php');"
# Déplace le fichier exécutable Composer (composer.phar) dans le répertoire /usr/local/bin/, ce qui permet de l'exécuter globalement sur le système.
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /app

ENTRYPOINT [ "composer" ]

