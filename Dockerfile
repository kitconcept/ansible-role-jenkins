FROM ubuntu:14.04

RUN apt-get -y update && apt-get install -y curl git ansible python-apt jenkins-job-builder python-yaml python-lxml

ADD . /ansible-jenkins

WORKDIR /ansible-jenkins

RUN ansible-galaxy install cmprescott.xml
RUN mkdir -p /etc/ansible/roles/ansible-role-jenkins-server/
RUN cp -R . /etc/ansible/roles/ansible-role-jenkins-server/
RUN ansible-playbook tests/test.yml -i hosts -vv

ENV JENKINS_HOME /var/lib/jenkins

ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--httpPort=8080"]

EXPOSE 8080

CMD [""]
