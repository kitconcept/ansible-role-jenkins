Ansible Role Jenkins Plone
==========================

Ansible role to set up a Jenkins server for Plone development.

Create Docker image for jenkins-master::

  $ docker build -t jenkinsmaster .

Start Docker image::

  $ docker run -d -p 8080:8080 jenkinsmaster

Open Jenkins in the browser::

  $ open "http://$(docker-machine ip jenkinsmaster):8080/"

Run Tests::

  $ pybot test.robot

Misc
----

Check if Docker image is running::

  $ docker ps -a

List local Docker images::

  $ docker-machine ls

Start Docker image::

  $ docker-machine start jenkins

Delete Docker image::

  $ docker-machine rm jenkins

SSH into Docker image::

  $ docker exec -it <IMAGE_ID> bash

Start Service::

  $ docker exec <IMAGE_ID> /etc/init.d/jenkins start

