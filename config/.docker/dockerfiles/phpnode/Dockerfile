ARG NODE_IMAGE
ARG APACHE_IMAGE
ARG APP_FOLDER
## Compilation js/css
FROM ${NODE_IMAGE} as frontend
#Ajout des proxy pour contruire l'image
ENV HTTP_PROXY http://proxy.dsi.uca.fr:8080
ENV HTTPS_PROXY http://proxy.dsi.uca.fr:8080
ENV NO_PROXY ".uca.fr,localhost,gitlab.dsi.uca.fr,.dev.dsi.uca.fr"
RUN export http_proxy=$HTTP_PROXY
RUN export https_proxy=$HTTPS_PROXY
RUN export no_proxy=$NO_PROXY

WORKDIR /app

COPY ${APP_FOLDER}/package*.json ./
RUN yarn

COPY ${APP_FOLDER}/assets/ ./assets/
COPY ${APP_FOLDER}/vite.config.js ./

RUN yarn build

## Build image pour prod
FROM ${APACHE_IMAGE}
#Ajout des proxy pour contruire l'image
ENV HTTP_PROXY http://proxy.dsi.uca.fr:8080
ENV HTTPS_PROXY http://proxy.dsi.uca.fr:8080
ENV NO_PROXY ".uca.fr,localhost,gitlab.dsi.uca.fr,.dev.dsi.uca.fr"
RUN export http_proxy=$HTTP_PROXY
RUN export https_proxy=$HTTPS_PROXY
RUN export no_proxy=$NO_PROXY

COPY .docker/apache/vhost.conf /etc/apache2/sites-enabled/000-default.conf
COPY .docker/php/php.ini /usr/local/etc/php/conf.d/app.ini
COPY ${APP_FOLDER} /var/www/html
COPY .docker/scripts/entrypoint.sh /var/www/entrypoint.sh

# Gestion crons
COPY .docker/cron /etc/cron.d/cron
RUN chmod 0644 /etc/cron.d/cron
RUN crontab /etc/cron.d/cron

## copie fichiers js/css si necessaire
COPY --from=frontend /app/public/build/ /var/www/html/public/build/
RUN rm yarn.lock package*.json vite.config.js

WORKDIR /var/www/html

RUN usermod -u 1000 www-data

RUN chmod +x /var/www/entrypoint.sh

CMD ["apache2-foreground"]

ENTRYPOINT ["/var/www/entrypoint.sh"]
