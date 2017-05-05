FROM tomcat:8.5.14-jre8-alpine

MAINTAINER jsonoda@getmealticket.com

RUN apk --no-cache add maven

COPY tomcat-deps.xml /tmp/tomcat-deps.xml
RUN mvn dependency:copy-dependencies -f /tmp/tomcat-deps.xml -Dmaven.repo.local=/tmp/m2
RUN rm /tmp/tomcat-deps.xml
RUN rm -rf /tmp/m2
RUN apk del maven

COPY reporting.properties /root/reporting.properties
COPY startup.sh /root/startup.sh
COPY context.xml /usr/local/tomcat/conf/context.xml

RUN chmod u+x /root/startup.sh
CMD /root/startup.sh
EXPOSE 8080
