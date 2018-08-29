mkdir ~/Scripts
export PATH=/Users/$USER/Scripts:$PATH

# Create dirs
Define BASE_PATH in config.sh
BASE_PATH/Sites
BASE_PATH/Projects


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
wp --info

chmod +x ~/Scripts/config.sh
chmod +x ~/Scripts/install-wp.sh


sudo rsync -avP ~/wordpress/ /var/www/FirstSite/
sudo rsync -avP ~/wordpress/ /var/www/SecondSite/
Give ownership of the directories to the Apache web user and then add your linux username to the web group:

sudo chown www-data:www-data * -R
sudo usermod -a -G www-data linux_user_name

sudo ln -s /home/ubuntu/workspace/prueba/pro1/ /var/www/pro1

