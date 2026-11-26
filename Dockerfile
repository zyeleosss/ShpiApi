FROM python:3.10-slim

WORKDIR /app

# Install system dependencies for curl_cffi
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app (including run.sh and main.py)
COPY . .

# Make run.sh executable
RUN chmod +x run.sh

# Expose the default port (Render will override this)
EXPOSE 8090

# Start the app using your run.sh script
CMD ["./run.sh"]
