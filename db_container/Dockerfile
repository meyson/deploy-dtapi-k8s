FROM ubuntu:latest as builder
RUN set -eux; \
      apt update; \
      apt install -y wget; \
      wget "https://dtapi.if.ua/~yurkovskiy/dtapi_full.sql" -P "./dump"; \
      wget "https://dtapi.if.ua/~yurkovskiy/IF-108/sessions.sql" -P "./dump"

RUN echo '#!/bin/bash\n\
BASE_DIR="/docker-entrypoint-initdb.d" \n\
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$BASE_DIR/dtapi_full.sql" \n\
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$BASE_DIR/sessions.sql"'\
>> dump/load_dump.sh

FROM mysql:5.7
COPY --from=builder ./dump /docker-entrypoint-initdb.d
