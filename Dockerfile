FROM alpine:latest


#install python
RUN apk update && apk add \
    python

#no need to add cleaning command as alpine cleans package automatically

#download kolibri
RUN wget -O kolibri http://learningequality.org/r/kolibri-pex-latest

#make executable
RUN chmod +x kolibri

#used for storing db and content (used when mounting volume)
RUN mkdir /root/.kolibri

EXPOSE 8080

CMD ./kolibri start && tail -f /root/.kolibri/server.log
