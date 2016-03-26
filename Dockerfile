FROM ubuntu:14.04

RUN apt-get -y update && apt-get install -y curl git ansible python-apt jenkins-job-builder python-yaml python-lxml

# Install Postfix
RUN echo "postfix postfix/mailname string localhost" | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
RUN apt-get install -y postfix
# RUN /etc/init.d/postfix start

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
