FROM sonarqube:community

# Define persistent volumes
VOLUME ["/opt/sonarqube/data", "/opt/sonarqube/logs", "/opt/sonarqube/extensions"]

# Expose necessary ports
EXPOSE 9000

# Start SonarQube
CMD [ "bin/run.sh" ]
