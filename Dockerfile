# Maven build container 

FROM maven:3.8.5-openjdk-11-slim AS maven_build

WORKDIR /app

COPY pom.xml .

COPY src /app/src

RUN mvn clean package

#pull base image

FROM openjdk:11-jdk-slim-bullseye

FROM httpd:2.4
COPY --from=maven_build /app/target/hello-world-0.1.0.jar usr/local/apache2/htdocs



#expose port 8080
EXPOSE 8080



