FROM ubuntu:14.04

RUN useradd --system -U -u 500 jenkins
RUN apt-get -y update && apt-get install -y curl git ansible python-apt jenkins-job-builder python-yaml supervisor python-lxml

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/log/docker
RUN mkdir -p /var/log/jenkins

ADD . /ansible-jenkins

WORKDIR /ansible-jenkins

RUN ansible-galaxy install cmprescott.xml -p roles
RUN ansible-playbook server.yml -i hosts

# EXPOSE 8080

# USER jenkins
# WORKDIR /usr/local/lib/jenkins

ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--httpPort=8080"]
EXPOSE 8080
CMD [""]
