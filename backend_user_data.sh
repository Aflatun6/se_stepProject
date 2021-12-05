#!/bin/bash 
sudo yum update -y
sudo yum install docker -y
sudo service docker start

sudo docker pull avelibeyli6/phonebook-backend
docker run -e MYSQL_URL=jdbc:mysql://${url} -e MYSQL_USER=${username} -e MYSQL_PASSWORD=${password} -p80:8080 avelibeyli6/phonebook-backend