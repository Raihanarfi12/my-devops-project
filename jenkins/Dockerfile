FROM jenkins/jenkins:lts

# Switch to root to run setup tasks
USER root

# Copy the certificate generation script
COPY generate_cert.sh /generate_cert.sh
RUN chmod +x /generate_cert.sh

# Generate the keystore before copying it
RUN /generate_cert.sh

# Copy the generated keystore to the correct location
COPY . .

# Set proper permissions
RUN chown jenkins:jenkins /var/jenkins_home/jenkins_keystore.jks && chmod 600 /var/jenkins_home/jenkins_keystore.jks

# Switch back to Jenkins user
USER jenkins
