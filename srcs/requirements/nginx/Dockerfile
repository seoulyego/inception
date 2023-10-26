FROM		debian:bullseye

EXPOSE	 	443

RUN	 	apt-get update && \
		apt-get upgrade && \
		apt-get -y install nginx openssl vim

COPY		./conf/default /etc/nginx/sites-available

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/yeongo.key -out /etc/ssl/yeongo.crt \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=yeongo"

RUN		chmod 700 /etc/ssl/yeongo.crt
RUN		chmod 700 /etc/ssl/yeongo.key

ENTRYPOINT	["nginx", "-g", "daemon off;"]
