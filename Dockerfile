
# Imagen base: Python 3.11 versión slim
FROM python:3.11-slim

# Metadata
LABEL maintainer="devops-academia"
LABEL description="App calculadora - Curso DevOps"

# Directorio de trabajo
WORKDIR /app

# Actualizar paquetes del sistema operativo
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copiar dependencias
COPY requirements.txt .

# Instalar dependencias del proyecto
RUN python -m pip install --no-cache-dir -r requirements.txt \
    && python -m pip install --no-cache-dir --upgrade pip setuptools wheel \
    && python -m pip check

# Copiar archivos del proyecto
COPY . .

# Crear usuario no privilegiado
RUN useradd -m -u 1000 appuser

# Ejecutar como usuario no privilegiado
USER appuser

# Puerto de la aplicación
EXPOSE 8000

# Ejecutar pruebas
CMD ["python", "-m", "pytest", "test/", "-v"]