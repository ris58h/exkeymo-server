FROM maven:3.8.1-openjdk-17-slim AS build
WORKDIR /app
COPY . /app
RUN mvn clean install

FROM openjdk:17-slim
WORKDIR /app
COPY --from=build /app/target/exkeymo-server-*-jar-with-dependencies.jar /app/exkeymo-server.jar
EXPOSE 80
CMD ["java", "-jar", "/app/exkeymo-server.jar"]