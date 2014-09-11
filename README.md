nginx-automator
===============

Script has been adapted from the following Digital Ocean community question answer by Justin Ellingwood: [Semi-automating Nginx server block set up on Ubuntu with a script?](https://www.digitalocean.com/community/questions/semi-automating-nginx-server-block-set-up-on-ubuntu-with-a-script)

## What nginx-wp.sh does

Automates an otherwise tedious Nginx server block set up for a WordPress site.

- Creates web root
- Creates server block file
- Enables server block
- Reloads nginx

## Usage

`./nginx-wp.sh example.com`

## Assumptions

- Your nginx server blocks are going to be set up in the /var/www/ directories.
- You use WordPress, or maybe some other PHP application.
- You use hhvm (hence the hhvm.conf include).