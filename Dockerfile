FROM epilanthanomai/cflakes:0.1
ENV ROOT /opt/flurry
WORKDIR $ROOT

COPY . $ROOT
COPY cron/generate /etc/periodic/daily/

RUN apk update && \
    apk add --update \
      xmlstarlet \
      librsvg \
      python3 \
      py3-cryptography

RUN pip3 install -r requirements.txt

CMD ["/usr/sbin/crond", "-f"]
