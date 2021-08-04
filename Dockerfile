FROM tomcat:alpine
RUN apk add curl --no-cache \
    && mkdir -p /opt/tomcat/tomcat1/webapps \
    && curl -sSf -u "admin:Samba@345" -O 'http://52.188.185.223:8081/artifactory/libs-release-local/helloworld-1.1.jar' \
    && cp  helloworld-1.1.jar  /opt/tomcat/tomcat1/webapps
<<<<<<< HEAD
CMD /opt/tomcat/tomcat1/webapps/helloworld-1.1.jar
=======
CMD /opt/tomcat/tomcat1/webapps/helloworld-1.1.jar
>>>>>>> 9ca85fe3925cf7a6efa605396b84837bec1d0168
