FROM debian:buster

#GET PACKAGES
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx wget mariadb-server php-fpm php-mysql php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi 

#PHPMYADMIN
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz
RUN	tar xvf phpMyAdmin-5.0.1-all-languages.tar.gz && \
	mv phpMyAdmin-5.0.1-all-languages /var/www/html/phpmyadmin
COPY srcs/config.inc.php /var/www/html/phpmyadmin
RUN chmod 660 /var/www/html/phpmyadmin/config.inc.php && \
	chown -R www-data:www-data /var/www/html/phpmyadmin

#SSL CERTIF&KHEY
COPY srcs/host.key /etc/ssl/certs/localhost.key
COPY srcs/host.cert /etc/ssl/certs/localhost.crt

#WORDPRESS
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz && mv wordpress var/www/html
RUN chown -R www-data /var/www/html/wordpress && chmod -R 755 /var/www/html/wordpress
COPY srcs/wp-config.php /var/www/html/wordpress
RUN	mkdir ./scripts
COPY srcs/init_db.sh scripts/
COPY srcs/init_db.sql /
RUN	sh ./scripts/init_db.sh

#TRASH
COPY srcs/default /etc/nginx/sites-available/localhost
COPY srcs/index.html /var/www/html/index.html
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm /var/www/html/index.nginx-debian.html
ENTRYPOINT service mysql start && service php7.3-fpm start && service nginx start && bash
