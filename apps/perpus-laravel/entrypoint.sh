#!/bin/bash

# Navigate to project directory
cd /var/www/html/perpus

# Ensure Composer dependencies are installed
composer update

# Copy environment file if not exists
if [ ! -f .env ]; then
    cp .env.example .env
fi

# Generate application key
php artisan key:generate

# Wait for MySQL to be ready
echo "Waiting for MySQL to be ready..."
until nc -z -v -w30 db 3306
do
  echo "Waiting for database connection..."
  sleep 5
done

# Set up the database
php artisan migrate --force
php artisan db:seed --force

# Start Apache
apache2-foreground
