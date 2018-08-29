#! /bin/bash

# Includes your config file
source config.sh

if [ $# -ne 1 ]; then
    echo $0: usage: Destination Name
    exit 1
fi

DEST=$1

# Create the database.
DB_NAME=$(echo $DEST | sed -e 's/-/_/g')
echo "Creating database $DB_NAME..."

random-string()
{
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

PASSWORD_ALEATORIO=$(random-string)


mysql -u$DB_USER -p$DB_PASS -e"CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -u$DB_USER -p$DB_PASS -e"CREATE USER $DB_NAME@localhost IDENTIFIED BY '$PASSWORD_ALEATORIO';"
mysql -u$DB_USER -p$DB_PASS -e"GRANT ALL ON $DB_NAME.* TO '$DB_NAME'@'localhost' IDENTIFIED BY '$PASSWORD_ALEATORIO'; FLUSH PRIVILEGES;"
# Download WP Core.
wp core download --path=$SITE_PATH/$DEST

# Generate the wp-config.php file
wp core config --path=$SITE_PATH/$DEST --dbname=$DB_NAME --dbuser=$DB_NAME --dbpass=$PASSWORD_ALEATORIO --extra-php <<PHP
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);
define('WP_MEMORY_LIMIT', '256M');
PHP

# Install the WordPress database.
wp core install --path=$SITE_PATH/$DEST --url=$BASE_URL/$DEST --title=$DEST --admin_user=test --admin_password=test --admin_email=YOU@YOURDOMAIN.com