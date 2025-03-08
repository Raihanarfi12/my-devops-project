#!/bin/bash

# Navigate to project directory
cd /var/www/html

# Install dependencies
composer install --no-dev --optimize-autoloader
# Ensure Composer dependencies are installed
composer update

# Copy environment file if not exists
if [ ! -f .env ]; then
    cp .env.example .env
fi

# Generate application key
php artisan key:generate

# Set up the database
php artisan migrate --force
php artisan db:seed --force

# Start Apache
apache2-foreground
