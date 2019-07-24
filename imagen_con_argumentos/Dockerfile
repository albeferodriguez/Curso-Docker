FROM nginx

RUN useradd Angus

COPY fruit /usr/share/nginx/html

ENV archivo docker

RUN echo "archivo" > /usr/share/nginx/html/env.html

WORKDIR /usr/share/nginx/html

EXPOSE 90	

LABEL version=1

USER Angus

RUN echo "Yo soy $(whoami)" > /tmp/yo.html

USER root

RUN cp /tmp/yo.html /usr/share/nginx/html/docker.html

VOLUME /var/log/nginx

CMD nginx -g 'daemon off;'




