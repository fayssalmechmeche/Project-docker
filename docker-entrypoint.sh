#!/bin/sh
# Démarre le serveur PostgreSQL et attendre qu'il soit prêt
# https://github.com/docker-library/postgres/issues/482#issuecomment-544977957
pg_ctl -D /var/lib/postgresql/data -o "-c listen_addresses=*" -w start

# Crée l'utilisateur s'il n'existe pas
if ! psql -tXAc "SELECT 1 FROM pg_roles WHERE rolname='$POSTGRES_USER'" | grep -q 1; then
    psql -c "CREATE USER $POSTGRES_USER WITH SUPERUSER LOGIN PASSWORD '$POSTGRES_PASSWORD';"
fi

# Garde le conteneur allumé
tail -f /dev/null
