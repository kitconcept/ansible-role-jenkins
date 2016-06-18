Ansible Role Jenkins Plone
==========================

Ansible role to set up a Jenkins server for Plone development.

Usage
-----

playbook-jenkins-master.yml::

  ---
  - hosts: 127.0.0.1
    sudo: yes
    vars:
      jenkins_hostname: localhost
      jenkins_http_port: 8080
      jenkins_home_directory: /var/lib/jenkins
      jenkins_jar_location: /var/lib/jenkins/jenkins-cli.jar
      jenkins_plugins:
        - greenballs
      jenkins_url_prefix: ""
      jenkins_admin_email_address: info@kitconcept.com
      jenkins_url: jenkins.kitconcept.com
      jenkins_user: jenkins
      jenkins_number_of_executors: 1
      jenkins_username: jenkins
      jenkins_password: jenkins
      jenkins_mailer_default_suffix: "@localhost"
      jenkins_mailer_smtp_auth_username: ""
      jenkins_mailer_smtp_auth_password: ""
      jenkins_mailer_reply_to_address: "no-reply@localhost"
      jenkins_mailer_smtp_host: localhost
      jenkins_mailer_use_ssl: false
      jenkins_mailer_smtp_port: 25
      jenkins_mailer_charset: UTF-8
      jenkins_scm: bitbucket
    roles:
      - ansible-role-jenkins-server


Development
===========

Prerequisits
------------

Ubuntu::

  $ sudo apt-get install docker.io

OS X::

  $ docker-machine create --driver virtualbox jenkinsmaster
  $ docker-machine env jenkinsmaster
  $ eval $(docker-machine env jenkinsmaster)


Usage
-----

Build and start docker container::

  $ make build

Run tests against running docker container::

  $ make test

SSH into the docker container for inspection::

  $ make ssh

Destroy docker container::

  $ make clean


Build
-----

Create Docker image for jenkinsmaster::

  $ docker build -t jenkinsmaster .

Start Docker image::

  $ docker run -d -p 80:80 jenkinsmaster

Open Jenkins in the browser::

  $ open "http://$(docker-machine ip jenkinsmaster):80/"

Run Tests::

  $ pybot test.robot


Docker Controls
---------------

Check if Docker image is running::

  $ docker ps -a

SSH into Docker image::

  $ docker exec -it <IMAGE_ID> bash

Start Service::

  $ docker exec <IMAGE_ID> /etc/init.d/jenkins start

Remove all containers::

  $ docker rm $(docker ps -aq)


Docker Machine (OS X)
---------------------

List local Docker images::

  $ docker-machine ls

Start Docker image::

  $ docker-machine start jenkinsmaster

Restart Docker image::

  $ docker-machine restart jenkinsmaster

Delete Docker image::

  $ docker-machine rm jenkinsmaster

