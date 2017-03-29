FROM python:2-alpine

MAINTAINER Bernardelli <bernardelli.marcos@gmail.com>

ENV PGADMIN_HOME=/usr/local/lib/python2.7/site-packages/pgadmin4 \
  BASE_URL=https://ftp.postgresql.org/pub/pgadmin3/pgadmin4/v1.3/pip/pgadmin4-1.3-py2.py3-none-any.whl

RUN apk add --no-cache postgresql-dev gcc musl-dev
RUN pip --no-cache-dir install ${BASE_URL}
RUN mkdir -p /pgadmin4/queries

WORKDIR ${PGADMIN_HOME}

RUN cp config.py config_local.py && \
  sed -i "s/SERVER_MODE = True/SERVER_MODE = False/g" config_local.py && \
  sed -i "s/DEFAULT_SERVER = 'localhost'/DEFAULT_SERVER = '0.0.0.0'/g" config_local.py

EXPOSE 5050

ENTRYPOINT ["python", "pgAdmin4.py"]
