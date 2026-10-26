# Imagen base: Python 3.11 versión slim (más pequeña)
FROM python:3.11-slim

# Metadata
LABEL maintainer="devops-academia"
LABEL description="App calculadora - Curso DevOps"

# Directorio de trabajo
WORKDIR /app

# Copiar dependencias PRIMERO (aprovecha caché de Docker)
COPY requirements.txt .

# Instalar dependencias sin guardar caché de pip
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código fuente (cambia frecuentemente, va al final)
COPY . .

# Crear usuario no root por seguridad
RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app
USER appuser

# Documentar el puerto
EXPOSE 8000

# Comando por defecto: ejecutar los tests
CMD ["pytest", "test/", "-v"]
