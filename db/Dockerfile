FROM mariadb:latest

RUN touch /etc/my.cnf && \
    echo '[mysqld]' >> /etc/my.cnf && \
    echo 'character-set-server=utf8mb4' >> /etc/my.cnf && \
    echo '[client]' >> /etc/my.cnf && \
    echo 'default-character-set=utf8mb4' >> /etc/my.cnf
