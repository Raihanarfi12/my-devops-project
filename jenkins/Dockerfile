FROM jenkins/jenkins:lts

# Switch to root to run setup tasks
USER root

# Copy the script
COPY . .
RUN chmod +x /generate_cert.sh

# Generate the keystore before copying it
RUN /generate_cert.sh
COPY /jenkins_keystore.jks /var/jenkins_home/jenkins_keystore.jks

# Set proper permissions
RUN chown jenkins:jenkins /var/jenkins_home/jenkins_keystore.jks && chmod 600 /var/jenkins_home/jenkins_keystore.jks

# Switch back to Jenkins user
USER jenkins
