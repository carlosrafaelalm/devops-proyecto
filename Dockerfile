FROM python:3.11-slim

LABEL maintainer="devops-academia"
LABEL description="App calculadora - Curso DevOps"

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Recrear el ejecutable de pytest
RUN python -m pip install --no-cache-dir --force-reinstall pytest==8.0.0

COPY . .

RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app
USER appuser

EXPOSE 8000

CMD ["python", "-m", "pytest", "test/", "-v"]
