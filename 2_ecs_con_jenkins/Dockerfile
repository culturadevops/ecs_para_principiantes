FROM jenkins/jenkins:lts
 #https://updates.jenkins.io/download/plugins/
 #docker build -t jenkins .
 #docker run  -dp "80:8080" -v /var/run/docker.sock:/var/run/docker.sock --restart=always jenkins 
USER root


RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN apt install maven -y
RUN apt install awscli -y
RUN apt-get install python3-pip -y
RUN pip3 install --upgrade awscli
RUN apt-get install apt-transport-https -yq \
 ca-certificates \
 curl \
 software-properties-common \
 sudo

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
    && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" \
    && sudo apt-get update \
    && sudo apt-get install docker-ce=18.03.1~ce-0~ubuntu -yq

RUN usermod -aG docker jenkins
