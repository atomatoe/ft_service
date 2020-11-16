# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atomatoe <atomatoe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 18:40:43 by atomatoe          #+#    #+#              #
#    Updated: 2020/11/16 18:40:45 by atomatoe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

# UPDATE
RUN apk update && apk upgrade
RUN apk add supervisor
RUN apk add influxdb
COPY ./srcs/supervisord.conf /etc/

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN tar xvfz telegraf-1.15.3_linux_amd64.tar.gz
RUN apk add glibc-2.32-r0.apk
RUN cp -r /telegraf-1.15.3/* /
RUN ./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

RUN rm -f glibc-2.32-r0.apk
RUN rm -f telegraf-1.15.3_linux_amd64.tar.gz

COPY ./srcs/init_container.sh /tmp/
RUN chmod +x /tmp/init_container.sh

VOLUME	["var/lib/influxdb"]
EXPOSE 8086

ENTRYPOINT /usr/bin/supervisord