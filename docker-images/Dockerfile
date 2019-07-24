FROM ubuntu:latest 

RUN apt update
RUN apt install apache2 -y

WORKDIR /var/www/html

COPY startbootstrap-freelancer-master .

ENV contenido prueba

RUN echo "$contenido" > ./prueba.html

EXPOSE 8080

CMD apache2ctl -DFOREGROUND




