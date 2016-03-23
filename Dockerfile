FROM ubuntu:14.04

RUN apt-get -y update && apt-get install -y curl git ansible python-apt jenkins-job-builder python-yaml python-lxml

ADD . /ansible-jenkins

WORKDIR /ansible-jenkins

RUN ansible-galaxy install cmprescott.xml -p roles
RUN ansible-playbook server.yml -i hosts -vv

ENV JENKINS_HOME /var/lib/jenkins

ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--httpPort=8080"]

EXPOSE 8080

CMD [""]
