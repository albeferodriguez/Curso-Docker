<h1><strong> CURSO DOCKER DE UDEMY </strong></h1>

Docker es una plataforma de contenedores que permite construir, compartir y ejecutar funciones de manera segura.

Es una tecnología basada en imágenes.


<h3><strong> IMAGENES </strong></h3>

Las imágenes son paquetes que contienen la información necesaria para que funcione un servicio.
Se componen por una cantidad de n capas, por ejemplo:

<ul>
  <li> La capa 1 normalmente tiene un FROM que indica el SO que se va a usar</li>
  <li> La capa 2 tendrá algun RUN que ejecutará algun comando. </li>
  <li> La capa 3 tendrá el CMD con el fin de ejecutar y levantar un servicio </li>
</ul>

Las capas se crean mediante un archivo Dockerfile.

<h3><strong> CONTENEDORES </strong></h3>

Los contenedores son capas adicionales que permiten realizar una ejecución en tiempo real de las capas, todo el contenido del contendor es temporal.

Contiene imágenes, volúmenes, redes...

<h2><strong> DOCKER IMAGENES </strong></h3>

Existen empresas de software libre que tienen imágenes creadas para poder usar en contenedores, estas imágenes están almacenadas en docker hub.

<h4><strong> IMAGENES PERSONALIZADAS </strong></h4>

Para crear por ejemplo una imagen que tenga Apache y PHP tendremos que:

<ul>
  <li> Crear el Dockerfile</li>
  <li> Seleccionar con FROM el SO </li>
  <li> Instalar Apache </li>
</ul>

Puesto que queremos que en Docker esté todo automatizado debemos añadir las respuestas a las preguntas que nos salten por consola.
También podemos crear Tags personalizados.

CAPAS:

<ol>
  <li><strong> FORM: </strong> Establece el SO del sistema. </li>
  <li><strong> RUN: </strong> Ejecuta los comandos necesarios. </li>
  <li><strong> COPY: </strong> Sirve para copiar documentos. Si por ejemplo queremos usar Apache debemos copiar en la carpeta     var/www/html que es la que usa por defecto. </li>
  <li><strong> ADD: </strong> Es similar al COPY pero se utiliza para añadir direcciones URL externos a un archivo. </li>
  <li><strong> ENV: </strong> Sirve para crear variables de entorno. </li>
  <li><strong> WORKDIR: </strong> Sirve para declarar rutas y evitar que se repitan sucesivamente. </li>
  <li><strong> EXPOSE: </strong> Indica el puerto que se va a utilizar. </li>
  <li><strong> LABEL: </strong> Sirve para añadir metadata a la imagen. </li>
  <li><strong> CMD: </strong> Proporciona valores predeterminados para un contenedor en ejecución. </li>
  <li><strong> USER: </strong> Permite cambiar de usuario para ejecute las siguientes capas. </li>
  <li><strong> VOLUMEN: </strong> Permite que la capa sea persistente y no se elimine. </li>

</ol>


En la capa de CMD se puede ejecutar un script.

    #!/bin/bash

    echo "Iniciando container..."
    echo "INICIADO!!" > /var/www/html/ini.html
    apachectl -DFOREGROUND

Para evitar que se carguen ciertos archivos debemos incluirlos en .dockerignore

Para eliminar una imagen debemos usar el comando Docker rmi ID_imagen ó Nombre_imagen

<h4><strong> BUENAS PRÁCTICAS </h4></strong>

<ul>
  <li> Las imágenes han de ser efímeras, es decir, que se puedan destruir con facilidad. </li>
  <li> Debería existir un solo servicio instalado por imágen. </li>
  <li> Importante añadir a .dockignore los archivos que no usemos. </li>
  <li> Usar las capas justamente necesarias. </li>
  <li> Los argumentos se deben separar si fueran demasiados largos. </li>
  <li> Podemos pasar varios argumentos en una sola capa en lugar de usar muchas capas. </li>
  <li> No instalar paquetes innecesarios. </li>
  <li> Es importante usar Labels para aplicar la metadata a la imagen. </li>
</ul>

<h4><strong> CAMBIAR NOMBRE AL DOCKERFILE </strong></h4>

A la hora de crear la imagen debemos de asignarle un nuevo nombre y con un flag añadir el dockerfile.

    docker build -t test -f my-dockerfile
    
    
<h4><strong> DANGLING IMAGES </strong></h4>

Las dangling images son imagenes que no son referencias porque se ha creado con posterioridad otra imagen con el mismo nombre.
Para evitar esto debemos asignar tags a las imagenes para que estas no se queden sin referenciar:

    docker build -t test:v1
    docker build -t test:v2
    docker build -t test:v3
    
Si quisieramos eliminar todas las imagenes sin referencias deberamos filtrar y utilizar el comando xargs de linux para poder borrar todas:

    docker images -f dangling=true -q | xargs docker rmi
    

 <h2><strong> DOCKER CONTENEDORES </strong></h2>
 
Los contenedores son instancias de imagenes en ejecución.

Para poder <u><strong>listar</strong></u> los contenederos en uso debemos utilizar el siguiente comando:

     docker ps
     
Para <u><strong>mapear</strong></u> un contenedor a un puerto en concreto debemos añadir la funcion -p al ejecutarlo y el puerto donde queremos que se ejecute:

    docker run -d -p 8080:8080 jenkins
    
Para poder <u><strong>eliminar</strong></u> los contenedores debemos usar el comando -f para forzarlo si esta arrancado acompañado del comando rm

    docker rm -f <nombre del contenedor>
    
Para <u><strong>renombrar</strong></u> un contenedor debemos utilizar el comando rename poniendo primero el nomber actual seguido del nuevo nombre
 
    docker ps (para ver el nombre actual)
    docker rename <nombre_antiguo> <nombre_nuevo>
    
 Para <u><strong>detener</strong></u> un contenedor debemos utilizar el comando stop seguido del nombre del contenedor.
 
    docker stop <Nombre contenedor> o <ID>
    
Para <u><strong>iniciar</strong></u> un contenedor que este detenido debemos usar el comando start

    docker start <Nombre contenedor>
    
Para <u><strong>reiniciar</strong></u> un contenedor debemos usar el comando restart

    docker restart <Nombre contenedor>
    
Para <u><strong>crear consola dentro del terminal</strong></u> debemos utilizar el comando exec con las opciones -ti (siendo t de terminal e i de interactivo) y añadiendo bash que va a ser el tipo de la shell.

    docker exec -ti <Nombre contenedor> bash

Si quisieramos entrar al contenedor como root debemos añadir la opcion -u (usuario) y especificarle root

    docker exec -u root -ti <Nombre contenedor> bash
    
Esto nos sirve para poder ver si hay archivos, o cualquier cosa que necesitemos observar, en ejecucion.
Por ejemplo Jenkins nos pide que escribamos una contraseña que se encuentra dentro del contendor jenkins que hemos creado previamente, entonces lo que hacemos es crear un consola bash y acceder a ese archivo.

<h4><strong> VARIABLES DE ENTORNO </strong> </h4>

Las variables de entorno se pueden definir tanto en el dockerfile.

Para crear una imagen con un SO debemos usuar las opciones -dti

    docker build -dti --name env env
    
Para crear variables de entorno cuando el contenedor se crea debemos usar la opcion -e

    docker run -dti -e "prueba1=4321" --name eviroment env
    
Para poder usar mysql en el contenedor debemos acceder a el e instalar mysql

<h4><strong> CREAR UN CONTENEDOR MYSQL </strong></h4>
 
Para crear un contenedor con mysql debemos de tener instalado mysql en nuestro SO y en Docker.
 
Una vez tenemos eso, al lanzar el comando run debemos especificar el nombre y crear una variable de entorno MYSQL_ROOT_PASSWORD con la contraseña que queramos y por ultimo el tag de mysql
 
    Docker run -d --name my-db1 -e "MYSQL_ROOT_PASSWORD=1234" mysql:5.7
    
Luego para ver si nos funciona podemos entrar al puerto donde mapeamos el contenedor, si no lo hemos mapeado podemos acceder con la ip que se optiene usando el comando inspect

    Docker inspect
    mysql -u root -h <IP_ADDRESS> -p<CONTRASEÑA>
    
Un contenedor con mas informacion para la base de datos seria el siguiente:

    docker run -d --name my-db3 -p 3333:3306 -e "MYSQL_ROOT_PASSWORD=1234" -e "MYSQL_DATABASE=docker" -e "MYSQL_USER=docker" -e "MYSQL_PASSWORD=4321" mysql:5.7
    
Para eliminar todos los contenedores:

    docker rm -fv $(docker ps -aq)


<h2><strong> REDES </strong></h2>

Docker tiene una mini red virtual al macenada en Docker bridge

<h4><strong> REDES DEFINIDAS POR EL USUARIO </strong></h4>

Para crear una red definida por el usuario basta con usar el comando create y asignarle un nombre.

    Docker network create test-network
    
Si queremos asignarle una subnet (--subnet) y si queremos asignarle un gateway (--gateway)

    Docker network create -d bridge --subnet 127.110.10.0/24 --gateway 172.124.10.1
    
<h4><strong> INSPECCIONAR REDES </strong></h4>

Utilizamos el comando inspect

    Docker network inspect <nombre de la red>
    
<h4><strong> AGREGAR CONTENEDORES A UNA RED DISTINTA A LA POR DEFECTO </strong></h4>

Solo necesitariamos añadir la red en el momento en el que creamos el contenedor usando el comnado --network

    docker run --network test-network -d -ti centos

<h4><strong> CONECTAR CONTENEDORES EN LA MISMA RED </strong></h4>

Creamos dos contenedores 

    docker  run -d --network test-network --name cont1 -ti centos
    docker  run -d --network test-network --name cont2 -ti centos

Para conectarlas entre ellas basta con hacer un ping de un contendor a otro

    docker exec cont1 bash -c "ping cont2"
    
<h4><strong> ELIMINAR REDES </strong></h4>

    docker network rm <nombre de la red>
    
<h4><strong> ASIGNAR IP A UN CONTENEDOR </strong></h4>

Basta con añadir la opcion --ip a la hora de crear un contenedor

    docker run --network my-net --ip 172.128.10.0/24 -d --name nginx1 -ti centos
    


  



