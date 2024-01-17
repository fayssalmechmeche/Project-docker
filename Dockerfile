FROM alpine:3.19

RUN apk update --no-cache \
    && apk add postgresql --no-cache \
    && mkdir /var/lib/postgresql/data \
    && chmod 755 /var/lib/postgresql/data \
    && adduser toto --disabled-password \
    && apk add sudo \ 
    && echo "toto ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER toto

EXPOSE 5432
