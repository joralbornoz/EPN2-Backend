# ETAPA 1: Construcción (Maven)
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests

# ETAPA 2: Ejecución (Runtime estable y disponible)
# Cambiamos a eclipse-temurin para evitar el error "not found"
FROM eclipse-temurin:17-jdk-focal
WORKDIR /app

# RÚBRICA: Usuario NO-ROOT para seguridad
RUN groupadd -r spring && useradd -g spring -r spring
USER spring:spring

COPY --from=build --chown=spring:spring /app/target/*.jar app.jar

# Límites de memoria para la t2.micro
ENTRYPOINT ["java", "-Xmx256m", "-jar", "app.jar"]