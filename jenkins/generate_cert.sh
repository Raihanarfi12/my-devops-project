#!/bin/bash

# Set working directory
cd /var/jenkins_home

# Check if keystore already exists
if [ -f "jenkins_keystore.jks" ]; then
  echo "Keystore already exists, skipping generation."
  exit 0
fi

# Load environment variables
if [ -f /var/jenkins_home/.env ]; then
  export $(cat /var/jenkins_home/.env | grep -v '^#' | xargs)
fi

# Ensure FQDN and KEYSTORE_PASSWORD are set
if [ -z "$FQDN" ]; then
  echo "FQDN is not specified in the .env file."
  exit 1
fi

if [ -z "$KEYSTORE_PASSWORD" ]; then
  echo "KEYSTORE_PASSWORD is not specified in the .env file."
  exit 1
fi

# Generate keystore
keytool -genkey -keyalg RSA -alias selfsigned -keystore jenkins_keystore.jks \
  -storepass "$KEYSTORE_PASSWORD" -keysize 4096 -dname "CN=$FQDN, OU=DevOps, O=YourOrganization, L=YourCity, ST=YourState, C=US"

# Set permissions
chown jenkins:jenkins jenkins_keystore.jks
chmod 600 jenkins_keystore.jks

echo "Keystore jenkins_keystore.jks created successfully."
