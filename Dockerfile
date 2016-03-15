FROM ubuntu:14.04

RUN useradd --system -U -u 500 jenkins
RUN apt-get -y update && apt-get install -y curl git ansible python-apt jenkins-job-builder python-yaml supervisor

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/log/docker
RUN mkdir -p /var/log/jenkins

# Add the default supervisor conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD . /ansible-jenkins

WORKDIR /ansible-jenkins

RUN ansible-playbook server.yml -i hosts

EXPOSE 80 8080

# USER jenkins
# WORKDIR /usr/local/lib/jenkins

CMD ["/usr/bin/supervisord"]

# CMD ["nginx", "-g", "daemon off;", "&&", "/etc/init.d/jenkins", "start"]
