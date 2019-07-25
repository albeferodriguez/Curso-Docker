FROM ubuntu:latest 

LABEL version=1.0
LABEL description="This is an apache image"
LABEL vendor=yo

RUN apt update
RUN apt install apache2 -y

COPY startbootstrap-freelancer-master /var/www/html

RUN echo "$(whoami)" > /var/www/html/user1.html

RUN useradd gema

USER gema

RUN echo "$(whoami)" > /tmp/user2.html

VOLUME /var/www/html

USER root

RUN cp /tmp/user2.html /var/www/html/user2.html

COPY run.sh /run.sh

CMD sh /run.sh




