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
</ol>
