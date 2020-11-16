# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atomatoe <atomatoe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 18:41:41 by atomatoe          #+#    #+#              #
#    Updated: 2020/11/16 18:44:01 by atomatoe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

# UPDATE
RUN apk update && apk upgrade
RUN apk add openrc php7 php7-fpm php7-iconv php7-json php7-mbstring php7-mysqli php7-phar php7-session
RUN rc-update add php-fpm7 default

RUN	mkdir -p /var/www/phpmyadmin /var/www/phpmyadmin/tmp
RUN	chmod +x /var/www/phpmyadmin/tmp
RUN	wget -c https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz
RUN	tar -xvf phpMyAdmin-latest-english.tar.xz --strip-components 1 -C /var/www/phpmyadmin && rm -f phpMyAdmin-latest-english.tar.xz
COPY srcs/config.inc.php /var/www/phpmyadmin/config.inc.php

EXPOSE 5000
CMD php -S 0.0.0.0:5000 -t /var/www/phpmyadmin/