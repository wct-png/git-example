# 第一阶段：编译
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app
COPY WebServer.java .
RUN javac WebServer.java

# 第二阶段：运行
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/WebServer*.class .
EXPOSE 8080
CMD ["java", "WebServer"]
