FROM		debian:bullseye

EXPOSE		3306

RUN		apt-get update && \
		apt-get upgrade && \
		apt-get install -y mariadb-server mariadb-client vim && \
		mkdir -p /var/run/mysqld && \
		chown mysql:mysql /var/run/mysqld && \
		apt-get install -y dumb-init

COPY		./conf/my.cnf /etc/mysql/my.cnf
COPY		./tools/entry.sh /

RUN		chmod +x entry.sh

ENTRYPOINT	["/usr/bin/dumb-init", "--", "/entry.sh"]
