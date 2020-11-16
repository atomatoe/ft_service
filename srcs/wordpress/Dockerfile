# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atomatoe <atomatoe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 18:44:07 by atomatoe          #+#    #+#              #
#    Updated: 2020/11/16 19:52:42 by atomatoe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

# UPDATE
RUN apk update && apk upgrade
RUN apk add --no-cache  openrc mysql mysql-client php7 php7-fpm php7-json php7-mysqli
RUN rc-update add php-fpm7 default

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz

RUN mkdir -p /var/www/wordpress 
RUN mv wordpress /var/www/wordpress 
RUN rm -rf latest.tar.gz

RUN mkdir -p /var/run/php

EXPOSE 5050
CMD php -S 0.0.0.0:5050 -t /var/www/wordpress/wordpress