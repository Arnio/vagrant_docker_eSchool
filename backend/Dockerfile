# Pull base image.
FROM amazoncorretto:latest

RUN \
# Update
yum update -y

COPY ./target/eschool.jar ./app/eschool.jar

COPY ./backend/application.properties ./app/application.properties
EXPOSE 8080
CMD ["java", "-jar", "app/eschool.jar", "/app/application.properties"]
