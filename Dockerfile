FROM frolvlad/alpine-bash
RUN mkdir -p /usr/local/sbin \
	&& cd /usr/local/sbin \
	&& echo http://dl-cdn.alpinelinux.org/alpine/edge/main | tee /etc/apk/repositories \
	&& echo @testing http://dl-cdn.alpinelinux.org/alpine/edge/testing | tee -a /etc/apk/repositories \
	&& echo @community http://dl-cdn.alpinelinux.org/alpine/edge/community | tee -a /etc/apk/repositories \
	&& apk add gettext libintl \
	&& mv /usr/bin/envsubst /usr/local/sbin/envsubst
COPY . /app
WORKDIR /app
RUN chmod +x ./bin/entrypoint.sh
ENTRYPOINT [ "bin/entrypoint.sh" ]
CMD ["help"]