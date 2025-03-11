# Use the official Grafana image as a base
FROM grafana/grafana:latest

# Set environment variables (Optional: can be overridden in docker-compose)
ENV GF_SECURITY_ADMIN_USER=admin
ENV GF_SECURITY_ADMIN_PASSWORD=admin

# Copy custom Grafana config (if needed)
# COPY custom.ini /etc/grafana/grafana.ini

# Set work directory
WORKDIR /var/lib/grafana

# Expose Grafana default port
EXPOSE 3000

# Start Grafana
CMD ["/run.sh"]
