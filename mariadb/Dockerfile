FROM    debian:bullseye

EXPOSE  3306

RUN     apt-get update && \
        apt-get upgrade && \
        apt-get -y install mariadb-server mariadb-client && \
        mkdir -p /var/run/mysqld && \
        chown mysql:mysql /var/run/mysqld && \
        apt-get -y install dumb-init

COPY    ./conf/my.cnf /etc/mysql/my.cnf

# docker build -t mariadb .
# docker run -it mariadb
