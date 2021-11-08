#!/bin/bash
docker build -t lemp_serv . 
docker run -it --name serv -d -p 80:80 -p 443:443 lemp_serv