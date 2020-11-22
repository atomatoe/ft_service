# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atomatoe <atomatoe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 18:44:07 by atomatoe          #+#    #+#              #
#    Updated: 2020/11/17 15:28:17 by atomatoe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update
RUN apk add openrc nginx supervisor mysql mysql-client php7 php7-fpm php7-json php7-mysqli
RUN	rc-update add php-fpm7 default

RUN	mkdir -p /run/nginx
RUN	mkdir -p /var/run/php

COPY srcs/nginx.conf		/etc/nginx/conf.d/wordpress.conf
COPY srcs/supervisord.conf	/etc/supervisord.conf

RUN	sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf
RUN	sed -it 's/;   extension=mysql.so/extension=mysql.so/g' /etc/php7/php.ini

RUN	wget https://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz && rm -rf latest.tar.gz
RUN mv wordpress /var/www/wordpress
EXPOSE 5050

CMD	["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]