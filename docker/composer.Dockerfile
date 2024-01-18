FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add php82 php82-phar php82-iconv php82-openssl php82-ctype php82-xml php82-dom php82-tokenizer php82-mbstring php82-session php82-simplexml
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /app

ENTRYPOINT [ "composer" ]

