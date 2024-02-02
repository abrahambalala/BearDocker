FROM alpine

ENV Nginx_PORT=8080 Nginx_PROXY_PORT=22333 Nginx_PROXY_PATH=nginxtobear
ENV WebTemplate=https://github.com/abrahambalala/BearDocker/releases/download/website/website.zip
ENV Bear_VERSION=v4.32.1 Bear_Config_URL=

RUN set -ex \
        && apk update \
        && apk upgrade \
        && apk add --no-cache --virtual .build-deps ca-certificates git wget unzip nginx \
        && mkdir /tmp/beartmp  /usr/bin/bear \
        && wget -q -O website.zip ${WebTemplate} \
        && unzip website.zip -d /website \
		&& mv /website/*/* /var/lib/nginx/html/ \
		&& rm -rf /website
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE ${Nginx_PORT}

ENTRYPOINT ["/entrypoint.sh"]
