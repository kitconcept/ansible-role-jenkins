Ansible Role Jenkins Plone
==========================

Ansible role to set up a Jenkins server for Plone development.

Create Docker container for jenkinsmaster::

  $ docker-machine create --driver virtualbox jenkinsmaster
  $ docker-machine env jenkinsmaster
  $ eval $(docker-machine env jenkinsmaster)

Create Docker image for jenkinsmaster::

  $ docker build -t jenkinsmaster .

Start Docker image::

  $ JOB=$(docker run -d -p 80:80 jenkinsmaster)

Open Jenkins in the browser::

  $ open "http://$(docker-machine ip jenkinsmaster):80/"

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

Remove all containers::

  $ docker rm $(docker ps -aq)

