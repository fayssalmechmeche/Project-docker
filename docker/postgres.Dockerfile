FROM alpine:3.19

RUN apk update --no-cache 
RUN apk add postgresql --no-cache 
RUN mkdir /run/postgresql 
RUN chown postgres:postgres /run/postgresql/ 
USER postgres

RUN mkdir /var/lib/postgresql/data 
RUN chmod 0700 /var/lib/postgresql/data 
RUN initdb -D /var/lib/postgresql/data 

USER root
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER postgres
ENTRYPOINT "docker-entrypoint.sh"

EXPOSE 5432
