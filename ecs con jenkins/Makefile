crearjenkins:
	docker build -t jenkins .
runjenkins:
	docker run -d -p 81:8080 --name jenkins --restart=always jenkins:latest
startjenkins:
	docker start jenkins
jenkinsdios:
	sensible-browser https://www.youtube.com/watch?v=qVShk0UGGQU &
