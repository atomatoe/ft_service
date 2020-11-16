# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atomatoe <atomatoe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 18:40:21 by atomatoe          #+#    #+#              #
#    Updated: 2020/11/16 21:23:49 by atomatoe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

# UPDATE
FROM alpine:3.7

#update
RUN apk update && apk upgrade

#ftps upload
RUN		apk add vsftpd openrc openssl
RUN		rc-update add vsftpd default

#keys
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
           -subj '/C=RU/ST=UFA/L=UFA/O=21/OU=21 School/CN=atomatoe' \
           -keyout /etc/vsftpd/vsftpd.key \
           -out /etc/vsftpd/vsftpd.crt

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN		echo root:root | chpasswd

EXPOSE 21
CMD vsftpd /etc/vsftpd/vsftpd.conf