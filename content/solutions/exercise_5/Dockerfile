FROM openjdk:19-jdk-slim

COPY . /app

WORKDIR /app

RUN ./mvnw package

ENTRYPOINT ["java"]
CMD ["-jar", "./target/docker-example-1.1.3.jar"]