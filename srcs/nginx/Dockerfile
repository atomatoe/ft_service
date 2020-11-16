# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atomatoe <atomatoe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 18:41:22 by atomatoe          #+#    #+#              #
#    Updated: 2020/11/16 20:11:38 by atomatoe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

# UPDATE
RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssl openssh
RUN apk add supervisor
RUN apk add openrc

COPY nginx-localhost /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf 

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
           -subj '/C=RU/ST=UFA/L=UFA/O=21/OU=21 School/CN=atomatoe' \
           -keyout /etc/ssl/private/nginx-selfsigned.key \
           -out /etc/ssl/certs/nginx-selfsigned.crt
RUN echo -e "ssh_admin\nssh_admin" | adduser ssh_user

COPY init_container.sh /tmp/
RUN chmod +x /tmp/init_container.sh
RUN mkdir -p /run/nginx
EXPOSE 80 443 22
CMD ["/tmp/init_container.sh"]