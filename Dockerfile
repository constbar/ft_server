FROM debian:buster
LABEL maintainer="agroup@student.21-school.ru"
ENV ADMIN="agroup"

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nginx openssl vim
RUN apt-get -y install mariadb-server wget
RUN apt-get -y install php php-fpm php-mysql

# nginx
RUN rm -rf /etc/nginx/sites-enabled/default
COPY ./srcs/default.conf /etc/nginx/sites-enabled/localhost

# wp
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
COPY ./srcs/wp-config.php wordpress

# pma
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar xvf phpMyAdmin-5.0.4-all-languages.tar.gz 

# ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=RU/ST=Ivanovskaya/L=Ivanovo/O=ecole42/OU=school21/CN=agroup"

# local dir
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin 
RUN mkdir /var/www/html/welcome_nginx
RUN mv /var/www/html/index.nginx-debian.html /var/www/html/welcome_nginx
RUN mv wordpress /var/www/html

# clean + services
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm latest.tar.gz
COPY ./srcs/change_index.sh ./
COPY ./srcs/launch.sh ./
CMD bash launch.sh

EXPOSE 80
EXPOSE 443