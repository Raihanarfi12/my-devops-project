FROM nginx:latest

# Install OpenSSL for cert generation
RUN apt-get update && apt-get install -y openssl && rm -rf /var/lib/apt/lists/*

# Copy SSL cert generation script
COPY generate_cert.sh /docker-entrypoint.d/generate_cert.sh
RUN chmod +x /docker-entrypoint.d/generate_cert.sh

# Copy NGINX config (no validation at build time)
COPY nginx.conf /etc/nginx/nginx.conf