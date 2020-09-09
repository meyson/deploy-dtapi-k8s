FROM mysql:5.7

RUN echo '#!/bin/bash\n\
BASE_DIR="/docker-entrypoint-initdb.d" \n\
if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ] ; then \n\
  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$BASE_DIR/dtapi_full.sql" \n\
  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$BASE_DIR/sessions.sql" \n\
fi'\
>> /docker-entrypoint-initdb.d/load_dump.sh

COPY ./dump /docker-entrypoint-initdb.d
