## Create Wordpress Site automatically

# Create dirs
Define BASE_PATH in config.sh
BASE_PATH/Sites
BASE_PATH/Projects

# Install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
wp --info

# Asignate permissions for scripts
chmod +x ~/../config.sh
chmod +x ~/../install-wp.sh
chmod +x ~/../virtualhost/virtualhost.sh

# Create site wordpress
./install-wp.sh "mi-awesome-site.com"
./uninstall-wp.sh "mi-awesome-site.com"

# TODO:
Check permissions to files 
sudo chown www-data:www-data * -R
sudo usermod -a -G www-data linux_user_name

