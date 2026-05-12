# Etapa 1: Build con Maven
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src src
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución (JRE)
FROM eclipse-temurin:17-jre-alpine
# RÚBRICA IE1/IE6: Crear usuario no root (Buenas prácticas de seguridad)
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

WORKDIR /app
# Copiamos el jar compilado
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]