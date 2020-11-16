# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atomatoe <atomatoe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 18:41:16 by atomatoe          #+#    #+#              #
#    Updated: 2020/11/17 00:33:18 by atomatoe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	    alpine:latest
RUN	    	apk add openrc mysql mysql-client

COPY	    ./srcs/my.cnf ./etc/mysql/
COPY	    ./srcs/init_container.sh ./
COPY        ./srcs/wordpress.sql ./

VOLUME  	["/var/lib"]
EXPOSE  	3306

RUN         chmod +x ./init_container.sh

ENTRYPOINT	./init_container.sh