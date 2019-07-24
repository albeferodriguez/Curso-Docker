FROM nginx



RUN \ 
	echo "1" >> /usr/share/nginx/html/test.txt && \
	echo "2" >> /usr/share/nginx/html/test.txt &&  \
	echo "3" >> /usr/share/nginx/html/test.txt

