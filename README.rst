Ansible Role Jenkins Plone
==========================

Ansible role to set up a Jenkins server for Plone development.

Create Docker image for jenkins-master::

  $ docker build -t ansiblejenkins .

  $ docker build .

  $ eval "$(docker-machine env default)"


  $ virtualenv .env
  $ source .env/bin/activate
  $ pip install ansible
  $ ansible-galaxy install flyapen.jenkins -p roles/flyapen.jenkins/

  $ ansible-playbook server.yml -i hosts

Create Docker image::

  $ docker-machine create --driver virtualbox jenkins

List local Docker images::

  $ docker-machine ls

Start Docker image::

  $ docker-machine start jenkins

Delete Docker image::

  $ docker-machine rm jenkins

