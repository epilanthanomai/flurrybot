FROM epilanthanomai/cflakes
ENV ROOT /opt/flurry
WORKDIR $ROOT

COPY src $ROOT
COPY cron/generate.sh /etc/periodic/daily/

RUN apk update && \
    apk add --update \
      xmlstarlet \
      librsvg \
      python3 \
      py3-cryptography

RUN pip3 install Mastodon.py

CMD ["/usr/sbin/crond", "-f"]
