FROM maven:3.6.3-jdk-8 AS builder
WORKDIR /workspace/app
COPY . .
RUN mvn clean package -f ./pom.xml

FROM openjdk:8-jdk-alpine
WORKDIR /workspace/app

# 安装字体支持
RUN apk add --no-cache fontconfig ttf-dejavu && \
    fc-cache -f -v

COPY --from=builder /workspace/app/taiyuan-admin/target/*.jar app.jar

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "app.jar"]
