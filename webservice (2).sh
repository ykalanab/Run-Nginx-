#!/bin/bash
#created kalana
#date 5/6/2020
#check the Nginx server is running

#update packages and upgrade system
	echo '##installing updates...'
	sudo apt-get update -y
	
#install Nginx
	echo '##installing Nginx...'
	sudo apt-get install nginx -y
	if [[$? > 0]]
        then
                echo "****Nginx failed****"
                exit
        else
                echo "****Install Nginx****"
        fi

#install Firewall
	echo '##installing firewall..'
	sudo apt install firewalld -y
	sudo firewall-cmd --reload
	sudo systemctl start firewalld.service
	sudo firewall-cmd --reload

#firewall Port assign 
	echo '##adding port...'
	#sudo firewall-cmd --permanent --add-port=80/tcp
	sudo firewall-cmd --reload

#check localhost status

	if curl -s --head  --request GET http://localhost/ | grep "200 OK" > /dev/null; then
   		echo "localhost is UP"
   		cd /usr/share/nginx/html
   		firefox index.html
	else
   		echo "localhost is DOWN"
	fi



