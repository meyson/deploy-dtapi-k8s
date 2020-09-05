FROM mysql:5.7

RUN echo '#!/bin/bash\n\
BASE_DIR="/docker-entrypoint-initdb.d" \n\
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$BASE_DIR/dtapi_full.sql" \n\
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$BASE_DIR/sessions.sql"'\
>> /docker-entrypoint-initdb.d/load_dump.sh

COPY ./dump /docker-entrypoint-initdb.d
