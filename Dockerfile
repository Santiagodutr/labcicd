# Etapa de construcción (Build)
FROM maven:3.8.7-eclipse-temurin-11 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa de ejecución (Run)
FROM eclipse-temurin:11-jdk
EXPOSE 8080
COPY --from=build /app/target/labcicd-0.0.1-SNAPSHOT.jar labcicd-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/labcicd-0.0.1-SNAPSHOT.jar"]