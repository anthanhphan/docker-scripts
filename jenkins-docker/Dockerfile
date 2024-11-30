FROM jenkins/jenkins:latest

USER root

# Install Tini
RUN apt-get update -qq && apt-get install -qqy tini

# Other setup steps
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    lsb-release

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update -qq && apt-get install -qqy docker-ce docker-ce-cli containerd.io

# Add Jenkins user to the Docker group
RUN usermod -aG docker jenkins

# Entry point
ENTRYPOINT ["/bin/sh", "-c", "service docker start && /usr/bin/tini -- /usr/local/bin/jenkins.sh"]
