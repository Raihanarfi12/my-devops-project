#!/bin/bash

# Load environment variables from the .env file
if [ -f .env ]; then
  export $(cat .env | grep -v '^#' | xargs)
fi

# Ensure that FQDN and STOREPASS are provided in the .env file
if [ -z "$FQDN" ]; then
  echo "FQDN is not specified in the .env file."
  exit 1
fi

if [ -z "$KEYSTORE_PASSWORD" ]; then
  echo "KEYSTORE_PASSWORD is not specified in the .env file."
  exit 1
fi

# Other parameters for the keystore generation
KEYALGO="RSA"
ALIAS="selfsigned"
KEYSIZE=4096
KEYSTORE="jenkins_keystore.jks"

# Run the keytool command to generate the keystore with the specified CN (FQDN)
keytool -genkey -keyalg $KEYALGO -alias $ALIAS -keystore $KEYSTORE -storepass $KEYSTORE_PASSWORD -keysize $KEYSIZE \
  -dname "CN=$FQDN, OU=DevOps, O=YourOrganization, L=YourCity, ST=YourState, C=US"

# Output result
echo "Keystore $KEYSTORE created with CN=$FQDN"

