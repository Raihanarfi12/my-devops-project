#!/bin/bash

# Navigate to project directory
cd /var/www/html

# Ensure Composer dependencies are installed
composer update

# Copy environment file if not exists
cp .env.example .env

# Generate application key
php artisan key:generate

# Set up the database
php artisan migrate --force
php artisan db:seed --force

# Start Apache
apache2-foreground
