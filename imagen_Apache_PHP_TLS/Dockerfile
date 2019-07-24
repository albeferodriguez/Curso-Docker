FROM ubuntu:latest

RUN \
	apt update	&& \
	apt-get install -y tzdata && \
	apt -y install openssl && \
	apt install apache2 -y && \
	apt install php-cli -y && \
	apt install php-common -y 
	
RUN echo "<?php phpinfo(); ?>" > /var/www/html/hola.php

COPY startbootstrap-freelancer-master /var/www/html

COPY ssl.config > /etc/apache2/sites-available/default

COPY docker.crt /docker.crt

COPY docker.key /docker.key

CMD apachectl -DFOREGROUND