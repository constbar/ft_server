#!/bin/bash
service nginx start
service php7.3-fpm start

service mysql start
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root
echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "GRANT ALL ON *.* TO 'admin'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

tail -f /var/log/nginx/access.log