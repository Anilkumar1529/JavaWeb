FROM centos
WORKDIR /javaweb
COPY . .
RUN yum -y install maven
RUN mvn package
ADD https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.94/bin/apache-tomcat-7.0.94.tar.gz .
RUN tar xvf apache-tomcat-7.0.94.tar.gz
COPY /javaweb/target/*.war /javaweb/apache-tomcat-7.0.94/webapps
EXPOSE 8080
