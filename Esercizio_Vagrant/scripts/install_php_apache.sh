sudo apt update
sudo apt install apache2 -y
sudo apt install php -y
sudo apt-get install php-mysqli -y
sudo apt install mysql-client -y

sudo wget -qO /var/www/html/adminer.php https://www.adminer.org/latest.php
sudo wget -qO /var/www/html/adminer.css https://raw.githubusercontent.com/vrana/adminer/master/designs/ng9/adminer.css
echo adminer installato

sudo sed -i 's/;extension=mysqli/extension=mysqli/' /etc/php/8.1/apache2/php.ini
sudo sed -i 's/;extension=mbstring/extension=mbstring/' /etc/php/8.1/apache2/php.ini

sudo systemctl restart apache2