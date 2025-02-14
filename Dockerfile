### Build stage
FROM maven:3.8.6-jdk-8 as builder
WORKDIR /tmp/build-dir
COPY . .
RUN cd /tmp/build-dir && mvn package

### Production stage
FROM eclipse-temurin:8-jre
RUN groupadd -r app && useradd --no-log-init -r -g app app
WORKDIR /home/app
COPY --from=builder /tmp/build-dir/container_start.sh /app/container_start.sh
RUN chmod 755 /app/container_start.sh
USER app
ENTRYPOINT ["/app/container_start.sh"]
EXPOSE 8080
COPY --from=builder /tmp/build-dir/target/app.jar /app/app.jar
