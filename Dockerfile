FROM proget.makedeb.org/docker/makedeb/makedeb:debian-bullseye

ARG DEBIAN_FRONTEND=noninteractive
# Install needed packages.
#RUN echo 'APT::GET::Assume-Yes "true";' | sudo tee /etc/apt/apt.conf.d/98accept
COPY 98accept /etc/apt/apt.conf.d/
USER makedeb
#WORKDIR /home/makedeb/
EXPOSE 80
RUN sudo apt update; sudo apt upgrade ; sudo apt install git apache2; sudo mkdir -p /var/www/html
WORKDIR /var/www/html
RUN sudo chown makedeb:makedeb -R . ; git clone https://mpr.makedeb.org/freetube-bin.git ; cd freetube-bin ; makedeb -i ; cd /var/www/html; rm index.html ; sudo chown www-data:www-data -R . 
#RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD ["sudo", "/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#CMD ["/bin/bash"]
