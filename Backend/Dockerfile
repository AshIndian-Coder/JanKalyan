FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -B -q dependency:go-offline
COPY src ./src
RUN mvn -B -q -DskipTests package

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/schemes-1.0.0.jar app.jar
EXPOSE 10000
ENTRYPOINT ["sh","-c","java -jar /app/app.jar --server.port=${PORT:-10000}"]
