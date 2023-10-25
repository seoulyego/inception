FROM    	debian:bullseye

EXPOSE  	9000

RUN     	apt-get update && \
		apt-get upgrade && \
		apt-get install -y php7.4 php7.4-mysql php-fpm wget curl dumb-init

RUN		mkdir -p /var/www/
RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xvf latest.tar.gz && mv /wordpress/* /var/www/
RUN		chown -R www-data:www-data /var/www/
RUN		rm -r /wordpress latest.tar.gz

COPY		./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY		./conf/wp-config.php /var/www/
COPY		./tools/entry.sh /tmp/

RUN		chmod +x /tmp/entry.sh

ENTRYPOINT	["/usr/bin/dumb-init", "--", "/tmp/entry.sh"]
