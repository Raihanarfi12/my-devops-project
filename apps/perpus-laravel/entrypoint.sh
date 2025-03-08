#!/bin/bash

# Navigate to project directory
cd /var/www/html

# Clear Composer cache
composer clear-cache

# Ensure Composer dependencies are installed
composer update

# Copy environment file if not exists
cp .env.example .env

echo "Waiting for database connection at $DB_HOST..."

sleep 90

# Generate application key
php artisan key:generate

# Set up the database
php artisan config:clear
php artisan config:cache
php artisan migrate --force
php artisan db:seed --force

# Start Apache
apache2-foreground
