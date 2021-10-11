#!/bin/bash
if [[ $1 == "on" ]]
then
	sed -i 's/autoindex off/autoindex on/g' /etc/nginx/sites-enabled/localhost
	service nginx reload
elif [[ $1 == "off" ]]
then
	sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-enabled/localhost
	service nginx reload
else
	echo "try: bash change_index.sh on / off"
fi