# ⚙️ EPN2 - Backend & Infraestructura (Spring Boot + AWS)

Este repositorio centraliza los microservicios de lógica de negocio y la configuración de infraestructura necesaria para el despliegue del stack completo en AWS.

## 🏗️ Arquitectura de Microservicios
El sistema se divide en dos servicios independientes:
* **Ventas API:** Gestión de transacciones comerciales.
* **Despachos API:** Control logístico de envíos.
* **Base de Datos:** Instancia de MySQL 8.0 con persistencia de datos.

## 📦 Orquestación con Docker Compose (IE2)
El archivo `docker-compose.yml` gestiona el stack completo, definiendo:
* **Redes (Networks):** Uso de `epn2-network` (driver bridge) para comunicación aislada entre contenedores.
* **Dependencias:** Control de orden de encendido (`depends_on`) para asegurar que la DB esté lista antes que las APIs.

## 💾 Persistencia de Datos (IE3)
Se implementan **Volúmenes de Docker** para garantizar que los datos de MySQL persistan aunque los contenedores se detengan o actualicen:
* Volumen: `epn2_db_data` mapeado a `/var/lib/mysql`.

## 🚀 Pipeline CI/CD (IE4)
Flujo automatizado mediante **GitHub Actions**:
1. **Construcción:** Generación de artefactos .jar y creación de imágenes Docker.
2. **Push:** Almacenamiento de imágenes en Docker Hub.
3. **Deploy:** Despliegue automático en instancia **AWS EC2** mediante comandos remotos SSH para actualizar el stack.

## 🔐 Seguridad e Infraestructura
* **AWS Security Groups:** Puertos 80, 8080 y 8081 habilitados para comunicación externa e interna.
* **Configuración de DB:** Uso de variables de entorno para credenciales seguras.

## 🛠️ Cómo desplegar
1. Clonar el repositorio en la instancia EC2.
2. Ejecutar el comando de orquestación:
   ```bash
   docker-compose up -d --build