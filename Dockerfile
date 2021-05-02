FROM python:2.7.16-slim-stretch
RUN apt-get update && apt-get dist-upgrade -y; \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4; \
    echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" > /etc/apt/sources.list.d/mongodb.list; \
    apt-get update; \
    apt-get install -y mongodb-org supervisor libgeoip-dev git
RUN mkdir -p /data/db
RUN git clone https://github.com/milesmcc/LibreNews-Server /code
WORKDIR /code/src
RUN pip install -r /code/requirements.txt
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./config.json config.json

CMD ["/docker-entrypoint.sh"]
