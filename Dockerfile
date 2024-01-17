FROM alpine:3.19

RUN apk update --no-cache 
RUN apk add postgresql --no-cache 
RUN mkdir /run/postgresql 
RUN chown postgres:postgres /run/postgresql/ 

USER postgres

RUN mkdir /var/lib/postgresql/data 
RUN chmod 0700 /var/lib/postgresql/data 
RUN initdb -D /var/lib/postgresql/data 
RUN pg_ctl start -D /var/lib/postgresql/data 


EXPOSE 5432
