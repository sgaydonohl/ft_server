Git clone the wonderful https://github.com/alexandregv/42toolbox

Run the init_docker script to start docker on your machine properly


Then, try on those to get to know docker :

1 - https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10 

2 - https://kifarunix.com/install-lemp-stack-on-debian-10-buster/

3 - https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-nginx-mariadb-and-php-on-debian-10

4 - https://serverfault.com/questions/224122/what-is-crt-and-key-files-and-how-to-generate-them

5 - https://medium.com/faun/setting-up-ssl-certificates-for-nginx-in-docker-environ-e7eec5ebb418

6 - https://api.wordpress.org/secret-key/1.1/salt/

CMD lines that might help you :

docker build -t yourImageName .

docker run  -p 80:80 -it yourImageName

docker images purge


Notes on the second cmd :

-p : define the port (you can define several port in the same cmd line)

-it  : let the image running on your terminal (don’t forget to service nginx start !!)
