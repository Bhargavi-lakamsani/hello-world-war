FROM alpine:latest as checkout
RUN apk add --no-cache git
WORKDIR /app
RUN git clone https://github.com/Bhargavi-lakamsani/hello-world-war.git .

FROM maven:3.8.4-openjdk-11 as build
WORKDIR /mvn
COPY --from=checkout /app .
RUN mvn clean install

FROM tomcat:8.0-alpine
COPY --from=build /mvn/target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
