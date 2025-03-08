#!/bin/bash

# Navigate to project directory
cd /var/www/html

# Clear Composer cache
composer clear-cache

# Ensure Composer dependencies are installed
composer update

# Copy environment file if not exists
cp .env.example .env

until mysql -h"$DB_HOST" -u"$DB_USERNAME" -p"$DB_PASSWORD" -e "SELECT 1"; do
  echo "Waiting for MySQL..."
  sleep 3
done

# Generate application key
php artisan key:generate

# Set up the database
php artisan migrate --force
php artisan db:seed --force
php artisan config:clear
php artisan config:cache
php artisan serve

# Start Apache
apache2-foreground
