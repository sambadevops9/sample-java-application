FROM tomcat:alpine
RUN apk add curl --no-cache \
    && mkdir -p /opt/tomcat/tomcat1/webapps \
    && curl -fsSL -o /opt/tomcat/tomcat1/webapps/snoop.jar http://52.188.185.223:8081/artifactory/libs-release-local/helloworld-1.1.jar
EXPOSE 8443
CMD /usr/local/tomcat/bin/cataline.bat run