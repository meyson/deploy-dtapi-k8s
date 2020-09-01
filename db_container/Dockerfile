FROM alpine:3.10.5 as builder
RUN set -eux; \
      wget "https://dtapi.if.ua/~yurkovskiy/dtapi_full.sql" -P "./dump"; \
      wget "https://dtapi.if.ua/~yurkovskiy/IF-108/sessions.sql" -P "./dump"

FROM mysql:5.7
#COPY --from=builder ./dumps /tmp/

RUN "echo 123 > 1.txt"
