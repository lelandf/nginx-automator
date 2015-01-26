#!/bin/bash

domain=$1
root="/var/www/$domain/html"
block="/etc/nginx/sites-available/$domain"

# Create the Document Root directory
sudo mkdir -p $root

# Assign ownership to your regular user account
sudo chown -R $USER:$USER $root

# Create the Nginx server block file:
sudo tee $block > /dev/null <<EOF 
server {
        listen 80;
        listen [::]:80;

        root /var/www/$domain/html;
        index index.php;

        server_name $domain www.$domain;

        location / {
                try_files \$uri \$uri/ /index.php?q=\$request_uri;
        }
        
        location ~ \.php\$ {
                try_files \$uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)\$;
                fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_index index.php;
                include fastcgi_params;
        }
}
EOF

# Link to make it available
sudo ln -s $block /etc/nginx/sites-enabled/

# Test configuration and reload if successful
sudo nginx -t && sudo service nginx reload