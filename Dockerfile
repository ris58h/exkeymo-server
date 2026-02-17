FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . /app
RUN mvn clean install

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=build /app/target/exkeymo-server-*-jar-with-dependencies.jar /app/exkeymo-server.jar
EXPOSE 80
CMD ["java", "-jar", "/app/exkeymo-server.jar"]
