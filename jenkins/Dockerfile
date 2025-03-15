FROM jenkins/jenkins:lts

# Switch to root to copy the script
USER root

# Copy the script into the container
COPY generate_cert.sh /generate_cert.sh
RUN chmod +x /generate_cert.sh

# Ensure the keystore is generated at runtime
ENTRYPOINT ["/generate_cert.sh"]

# Switch back to Jenkins user
USER jenkins
