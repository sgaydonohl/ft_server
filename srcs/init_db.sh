service nginx start
service mysql start
mysql -u root < init_db.sql
mysql -u root < /var/www/html/phpmyadmin/sql/create_tables.sql
