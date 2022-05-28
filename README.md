
# Spring Boot Docker

Very Simple application that runs a SpringBoot app in a Docker Container


## Prerequisites

- [Docker](https://docker.com) (preferably on a Linux distro)
- Use [Spring Initializr](https://start.spring.io/) or IDE to create a SpringBoot app
  - Select Maven project
  - Select Java as a Laguage
  - Add Spring Web as a dependency

## Build

Go to the project directory

```bash
  docker build -t spring-boot-docker:0.0.1 .
```

## Run Locally

Go to the project directory

```bash
  docker run -it -p 8080:8080 spring-boot-docker:0.0.1
```

Open browser to [http://localhost:8080](http://localhost:8080)

## Build and Run without a pre-built Docker Image
Build package via Maven using Docker

```bash
  docker run -it --rm --name spring-boot-docker -v "$(pwd)":/usr/src/maven -w /usr/src/maven maven:3.8.5-openjdk-18-slim mvn package
```

Run SpringBoot app using Docker

```bash
  docker run -it --rm --name spring-boot-docker -p 8080:8080  -v "$(pwd)":/usr/src/maven -w /usr/src/maven maven:3.8.5-openjdk-18-slim java -jar ./target/spring-boot-docker-0.0.1-SNAPSHOT.jar
```