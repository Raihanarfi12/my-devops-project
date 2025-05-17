FROM nginx:latest

# Install openssl
RUN apt-get update && apt-get install -y openssl && rm -rf /var/lib/apt/lists/*

# Copy script and config
COPY ./generate-cert.sh /tmp/generate-cert.sh
COPY ./nginx.conf /etc/nginx/nginx.conf

# Make script executable and run it
RUN chmod +x /tmp/generate-cert.sh && /tmp/generate-cert.sh

# Optional cleanup
RUN rm /tmp/generate-cert.sh
