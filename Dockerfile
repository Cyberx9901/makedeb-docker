FROM proget.makedeb.org/docker/makedeb/makedeb:debian-bullseye

####### Change PROGRAM var by directory of program in this repository for compile and package.
ARG PROGRAM=mindustry
#######

ARG DEBIAN_FRONTEND=noninteractive
COPY 98accept /etc/apt/apt.conf.d/
USER makedeb
EXPOSE 80
RUN sudo apt update; sudo apt upgrade ; sudo apt install git apache2; sudo mkdir -p /var/www/html/$PROGRAM/
WORKDIR /var/www/html
COPY $PROGRAM/* /var/www/html/$PROGRAM/
RUN sudo chown makedeb:makedeb -R . ; cd $PROGRAM ; makedeb -si ; cd /var/www/html; rm index.html ; sudo chown www-data:www-data -R . 
CMD ["sudo", "/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
