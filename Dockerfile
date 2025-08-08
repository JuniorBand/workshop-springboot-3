# Etapa de build
FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

COPY pom.xml .
RUN apt-get update && apt-get install -y maven
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn clean package -DskipTests

# Etapa final
FROM openjdk:21-jdk-slim



WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]


# FROM ubuntu:latest AS build

# RUN apt-get update
# RUN apt-get install openjdk-23-jdk -y

# COPY . .

# RUN apt-get install maven -y
# RUN mvn clean install

# FROM openjdk:21-jdk-slim

# EXPOSE 8080

# COPY --from=build /target/todolist-1.0.0.jar app.jar

# ENTRYPOINT [ "java", "-jar", "app.jar"]



