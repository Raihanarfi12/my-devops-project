# Use the official Prometheus image as the base
FROM prom/prometheus:latest

# Set working directory
WORKDIR /etc/prometheus

# Copy Prometheus configuration file
COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY alerts.yml /etc/prometheus/alerts.yml  # Optional: Alert rules

# Expose Prometheus default port
EXPOSE 9090

# Start Prometheus
CMD ["/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/prometheus"]
