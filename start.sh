#!/bin/bash
docker build -t agroup_server . 
docker run -it --name serv -d -p 80:80 -p 443:443 agroup_server