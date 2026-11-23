\# 1\. Imagen base oficial de Python 3.12 versión liviana
FROM python:3.12-slim
\# 2\. Definir la carpeta de trabajo dentro del contenedor 
WORKDIR /app
\# 3\. Copiar requirements.txt e instalar dependencias sin guardar caché COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
\# 4\. Copiar solo las carpetas necesarias para ejecutar el servicio 
COPY app/ ./app/ 
COPY frontend/ ./frontend/ 
COPY models/ ./models/
\# 5\. Exponer el puerto 8000 
EXPOSE 8000
\# 6\. Comando de arranque sirviendo la app en el host 0.0.0.0 y puerto 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
