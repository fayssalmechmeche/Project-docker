FROM alpine:3.19


# Ajouter curl
RUN apk add curl


# Ajouter des php extensions pour adminer
RUN apk add --no-cache curl php82 php82-pgsql php82-pdo_pgsql php82-ctype php82-iconv pcre2 php82-session php82-simplexml php82-tokenizer


# Téléchargez Adminer
RUN mkdir -p /var/www/html && \
    curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/index.php


# Définir le répertoire de travail
WORKDIR /var/www/html

# Définir le port 8080 
EXPOSE 8080

# commande par défault
ENTRYPOINT ["php", "-S", "0.0.0.0:8080"]
