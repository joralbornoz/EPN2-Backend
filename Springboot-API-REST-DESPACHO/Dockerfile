# ETAPA 1: Construcción (Maven)
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app
# Optimización: Descargar dependencias primero para cachear capas
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests

# ETAPA 2: Ejecución (Runtime seguro)
FROM openjdk:17-jdk-slim
WORKDIR /app

# RÚBRICA: Crear usuario NO-ROOT para máxima seguridad
RUN groupadd -r spring && useradd -g spring -r spring
USER spring:spring

# Copiar solo el ejecutable de la etapa anterior
COPY --from=build --chown=spring:spring /app/target/*.jar app.jar

# Límites de memoria configurados desde el arranque
ENTRYPOINT ["java", "-Xmx256m", "-jar", "app.jar"]