#!/bin/bash

sed -i "s/database_name_here/$DB_NAME/g" /etc/wordpress/config-localhost.php
sed -i "s/username_here/$DB_USER/g" /etc/wordpress/config-localhost.php
sed -i "s/password_here/$DB_PASSWORD/g" /etc/wordpress/config-localhost.php
sed -i "s/localhost/$DB_HOST/g" /etc/wordpress/config-localhost.php

apachectl -D FOREGROUND