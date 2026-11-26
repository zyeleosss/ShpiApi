FROM python:3.10-slim

WORKDIR /app

# Install dependencies for curl_cffi
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Ignore run.sh and run main.py directly
CMD ["python", "main.py"]
