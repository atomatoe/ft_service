# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atomatoe <atomatoe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 18:40:30 by atomatoe          #+#    #+#              #
#    Updated: 2020/11/16 20:24:19 by atomatoe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

# UPDATE
RUN apk update && apk upgrade

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.2.linux-amd64.tar.gz -C ./

RUN	rm -rf grafana-7.3.2.linux-amd64.tar.gz
RUN rm -f glibc-2.32-r0.apk
COPY srcs/grafana.db /grafana-7.3.2/data/grafana.db

EXPOSE 3000
WORKDIR /grafana-7.3.2/bin/
CMD	["./grafana-server"]