FROM alpine:3.19

RUN apk update --no-cache 
RUN apk add postgresql --no-cache 
RUN mkdir /run/postgresql 
RUN chown postgres:postgres /run/postgresql/ 
RUN su postgres -
USER postgres

RUN mkdir /var/lib/postgresql/data 
RUN chmod 0700 

RUN initdb -D /var/lib/postgresql/data 

CMD ["postgres", "-D", "/var/lib/postgresql/data"]
EXPOSE 5432
