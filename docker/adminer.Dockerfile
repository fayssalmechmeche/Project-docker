FROM alpine:3.19


RUN apk add curl git


RUN apk add php82 php82-ctype php82-iconv pcre2 php82-session php82-simplexml php82-tokenizer

# Téléchargez Adminer
RUN mkdir -p /var/www/html && \
    curl -L https://www.adminer.org/latest-mysql.php -o /var/www/html/index.php

WORKDIR /var/www/html

EXPOSE 8080

ENTRYPOINT ["php", "-S", "0.0.0.0:8080"]
