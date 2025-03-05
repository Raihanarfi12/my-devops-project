FROM jenkins/jenkins:lts

# Switch to root to copy the keystore file
USER root

# Copy the keystore file into the image
COPY jenkins_keystore.jks /var/jenkins_home/jenkins_keystore.jks

# Ensure proper permissions
RUN chown jenkins:jenkins /var/jenkins_home/jenkins_keystore.jks && chmod 600 /var/jenkins_home/jenkins_keystore.jks

# Switch back to Jenkins user
USER jenkins

