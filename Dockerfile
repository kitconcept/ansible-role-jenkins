FROM ubuntu:14.04

RUN useradd --system -U -u 500 jenkins
RUN apt-get -y update && apt-get install -y curl git ansible python-apt jenkins-job-builder python-yaml python-lxml

ADD . /ansible-jenkins

WORKDIR /ansible-jenkins

RUN ansible-galaxy install cmprescott.xml -p roles
RUN ansible-playbook server.yml -i hosts

# EXPOSE 8080

ENV JENKINS_HOME /home/jenkins/.jenkins

ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--httpPort=8080"]
EXPOSE 8080
CMD [""]
