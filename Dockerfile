
FROM python:3.12-slim

WORKDIR /app

# Copiar el archivo de requerimientos e instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar las carpetas del proyecto al contenedor
COPY app/ ./app/
COPY frontend/ ./frontend/
COPY models/ ./models/

# Exponer el puerto donde corre la aplicación
EXPOSE 8000

# Comando de inicio para ejecutar la API FastAPI con Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
