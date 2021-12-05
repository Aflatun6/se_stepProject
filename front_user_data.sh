#!/bin/bash 
sudo yum update -y
sudo yum install docker -y
sudo service docker start

sudo docker pull avelibeyli6/phonebook-frontend
sudo docker run -p80:8080 -e PHONEBOOK_API=http://${backend-loan-balancer-private-ip} avelibeyli6/phonebook-frontend