# Create Wordpress Site automatically

### Create dirs
```sh 
# Define BASE_PATH in config.sh
    mkdir BASE_PATH/Sites
    mkdir BASE_PATH/Projects
```

### Install wp-cli
```sh 
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wp
    wp --info
```
### Asignate permissions for scripts
```sh 
    chmod +x ~/../config.sh
    chmod +x ~/../install-wp.sh
    chmod +x ~/../virtualhost/virtualhost.sh
```

### Create site wordpress
```sh 
    ./install-wp.sh "mi-awesome-site.com"
    ./uninstall-wp.sh "mi-awesome-site.com"
```

#### TODO:
Check permissions to files 
```sh 
    sudo chown www-data:www-data * -R
    sudo usermod -a -G www-data linux_user_name
```
