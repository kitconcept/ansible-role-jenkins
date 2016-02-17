FROM ubuntu:14.04

RUN useradd --system -U -u 500 jenkins
RUN apt-get -y update && apt-get install -y curl git ansible

# Install Ansible inventory file
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Clone Ansible role repo
RUN git clone https://github.com/kitconcept/ansible-role-jenkins-plone.git
RUN cd ansible-role-jenkins-plone
RUN ansible server.yml

EXPOSE 8080

USER jenkins
WORKDIR /usr/local/lib/jenkins
