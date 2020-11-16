#!/bin/bash

#Delete last version
minikube delete

#Minikube
minikube start —vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f ./srcs/nginx/configmap.yaml
kubectl apply -f srcs/mysql/srcs/volume.yaml

#Nginx
docker build -t nginx_image ./srcs/nginx/ || emergency_exit
kubectl apply -f ./srcs/nginx/nginx.yaml || emergency_exit

#Word Press
docker build -t wordpress_image ./srcs/wordpress/ || emergency_exit
kubectl apply -f srcs/wordpress/srcs/wordpress.yaml || emergency_exit

#Phpmyadmin
docker build -t phpmyadmin_image ./srcs/phpmyadmin/ || emergency_exit
kubectl apply -f srcs/phpmyadmin/srcs/phpmyadmin.yaml || emergency_exit

#mysql
docker build -t mysql_image ./srcs/mysql/ || emergency_exit
kubectl apply -f srcs/mysql/srcs/msql.yaml || emergency_exit

#ftps
docker build -t ftps_image ./srcs/ftps/ || emergency_exit
kubectl apply -f srcs/ftps/srcs/ftps.yaml || emergency_exit

#influxdb
docker build -t influxdb_image ./srcs/influxdb/ || emergency_exit
kubectl apply -f srcs/influxdb/srcs/influxdb.yaml || emergency_exit

#grafana
docker build -t grafana_image ./srcs/grafana/ || emergency_exit
kubectl apply -f srcs/grafana/srcs/grafana.yaml || emergency_exit