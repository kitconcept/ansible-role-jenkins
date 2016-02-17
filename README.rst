Ansible Role Jenkins Plone
==========================

Ansible role to set up a Jenkins server for Plone development.

Create Docker image for jenkins-master::

  $ docker build .
  $ docker-machine create --driver virtualbox jenkins
  $ eval "$(docker-machine env default)"


  $ virtualenv .env
  $ source .env/bin/activate
  $ pip install ansible
  $ ansible-galaxy install flyapen.jenkins -p roles/ansible-jenkin

  $ ansible-playbook server.yml -i hosts
