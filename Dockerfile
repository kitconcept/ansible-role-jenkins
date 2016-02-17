FROM ubuntu:14.04

RUN useradd --system -U -u 500 jenkins
RUN apt-get -y update && apt-get install -y jenkins

EXPOSE 8080

USER jenkins
WORKDIR /usr/local/lib/jenkins
