FROM jenkins/jenkins:lts
 #https://updates.jenkins.io/download/plugins/
 #docker build -t jenkins .
 #docker run  -dp "80:8080" -v /var/run/docker.sock:/var/run/docker.sock --restart=always jenkins 
USER root
#si sabes trabajar con los plugin usa el comando siguiente
#RUN /usr/local/bin/install-plugins.sh \  
#   docker-workflow:1.26
#   dashboard-view:2.9.10 \  
#   pipeline-stage-view:2.4 \  
#   parameterized-trigger:2.32 \  
#   bitbucket:1.1.5 \  
#   git:3.0.5 \  
#   github:1.26.0 \
#   sonarqube-generic-coverage:1.0 \
#   ssh-slaves:1.31.0 \
#   ec2-fleet:1.17.0 \
#   configuration-as-code-groovy:1.1 \
#   pipeline-maven:3.8.2

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
