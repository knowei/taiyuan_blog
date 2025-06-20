FROM maven:3.6.3-jdk-8 AS builder
WORKDIR /workspace/app
COPY . .
RUN mvn clean package

FROM openjdk:8-jdk-alpine
WORKDIR /workspace/app
COPY --from=builder /workspace/app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
