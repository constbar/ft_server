## ft_server

project of École 42 where it is necessary to implement own LEMP web server in only one docker container.

it must run a wordpress with a mysql database and phpMyAdmin.

the project also have a self-signed certificate OpenSSL and an autoindex script on the container's root directory.

### how to use
before launching `docker` should be installed.

**to launch the project:**
```
bash start.sh
```
go to the site `https://www.localhost`

to enter to phpMyAdmin: username `admin` pass `password`

**to stop the project and delete docker images:**
```
bash stop.sh
docker rmi lemp_serv:latest
docker rmi debian:buster
```

