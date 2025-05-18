FROM jenkins/jenkins:lts

USER root

# Install Docker CLI, sshpass, and sudo
RUN apt-get update && \
    apt-get install -y docker.io sshpass sudo python3-pip && \
    apt-get clean

# Add Jenkins to Docker group
RUN usermod -aG docker jenkins

USER jenkins
