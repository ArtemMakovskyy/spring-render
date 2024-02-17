FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install -y openjdk-17-jdk
COPY . .
RUN chmod +x ./mvnw
RUN ./mvnw clean package

FROM openjdk:17-alpine
EXPOSE 8080
COPY --from=build /build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

#FROM maven:3.8.3-openjdk-17 AS builder
#
##COPY ./src src/
##COPY ./pom.xml pom.xml
#
#COPY . .
#
#RUN mvn clean package -DskipTests
#
#FROM openjdk:17-alpine
#COPY --from=builder  target/*.jar app.jar
#EXPOSE 8080
#CMD ["java", "-jar", "app.jar"]