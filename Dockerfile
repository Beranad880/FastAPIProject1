FROM python:3.12-slim

# Zabránění zápisu .pyc souborů a zajištění okamžitého výpisu logů
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Nejprve zkopírujeme požadavky pro efektivní využití Docker cache
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Zkopírování zbytku aplikace
COPY . .

# Výchozí port pro FastAPI
EXPOSE 8000

# Spuštění aplikace pomocí uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
