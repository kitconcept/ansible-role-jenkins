Ansible Role Jenkins Plone
==========================

Ansible role to set up a Jenkins server for Plone development.

Create Docker image for jenkins-master::

  $ docker build .
  $ docker-machine create --driver virtualbox jenkins
  $ eval "$(docker-machine env default)"
