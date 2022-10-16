## Build image pour prod
ARG APACHE_IMAGE
FROM ${APACHE_IMAGE}
#Ajout des proxy pour contruire l'image
ENV HTTP_PROXY http://proxy.dsi.uca.fr:8080
ENV HTTPS_PROXY http://proxy.dsi.uca.fr:8080
ENV NO_PROXY ".uca.fr,localhost,gitlab.dsi.uca.fr,.dev.dsi.uca.fr"
RUN export http_proxy=$HTTP_PROXY
RUN export https_proxy=$HTTPS_PROXY
RUN export no_proxy=$NO_PROXY

COPY infra/apache/vhost.conf /etc/apache2/sites-enabled/000-default.conf
COPY infra/php/php.ini /usr/local/etc/php/conf.d/app.ini
COPY ./app /var/www/html
COPY infra/scripts/entrypoint.sh /var/www/entrypoint.sh

# Gestion crons
COPY infra/cron /etc/cron.d/cron
RUN chmod 0644 /etc/cron.d/cron
RUN crontab /etc/cron.d/cron

WORKDIR /var/www/html

RUN usermod -u 1000 www-data

RUN chmod +x /var/www/entrypoint.sh

CMD ["apache2-foreground"]

ENTRYPOINT ["/var/www/entrypoint.sh"]
