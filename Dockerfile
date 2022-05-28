FROM maven:3.8.5-openjdk-18-slim AS builder

WORKDIR /src/usr/maven

COPY . .

RUN mvn verify && mvn package

#multi-stage build
FROM openjdk:18-jdk-slim

COPY --from=builder /src/usr/maven/target/*.jar app.jar

ENTRYPOINT [ "java", "-jar", "/app.jar" ]
