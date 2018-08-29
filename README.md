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

