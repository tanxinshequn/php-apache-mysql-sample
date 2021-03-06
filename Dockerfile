FROM ubuntu:14.04

MAINTAINER Xin Tan <tanxinshequn@163.com>

# install apache2 php5 curl gd imagemagick
RUN apt-get update && apt-get install -y curl vim apache2 php5 mysql-client php5-mysql php5-curl php5-gd imagemagick php5-imagick

# apache2 configuration file
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN rm /var/www/html/index.html

RUN chown www-data:www-data -R /var/www/html
RUN chmod 777 -R /var/www/html

RUN mkdir -p /var/tanxin
RUN chown www-data:www-data -R /var/tanxin
RUN chmod 777 -R /var/tanxin

VOLUME /var/www/html

RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

EXPOSE 80

COPY ./start.sh /start.sh
RUN chmod 777 /start.sh
CMD /start.sh
