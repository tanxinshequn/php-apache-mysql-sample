chmod 777 -R /var/www/html && chown www-data:www-data -R /var/www/html && /usr/sbin/apache2ctl -D FOREGROUND && tail -f /var/log/apache2/error.log
