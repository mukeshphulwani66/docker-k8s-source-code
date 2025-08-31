#!/bin/bash

# Update all packages to the latest version
yum update -y

# Install Apache HTTP server package
yum install httpd -y

# Start the Apache HTTP server service immediately
systemctl start httpd.service

# Enable the Apache service to start automatically on boot
systemctl enable httpd.service

# Create a basic web page and write it to the default website directory
echo "<h1>This is Webserver 1</h1>" > /var/www/html/index.html

# Create a subdirectory called 'india' under the web server root
mkdir /var/www/html/india

# Create another web page inside the 'india' directory
echo "<h1>Hi from India</h1>" > /var/www/html/india/index.html