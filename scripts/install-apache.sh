
#!/bin/bash

# Update Ubuntu packages
sudo apt update

# Install Apache
sudo apt install -y apache2

# Enable and start Apache
sudo systemctl enable --now apache2

# Set web directory ownership
sudo chown ubuntu:www-data /var/www/html

# Allow the Ubuntu user to upload website files
sudo chmod 775 /var/www/html

# Check Apache status
sudo systemctl status apache2 --no-pager
