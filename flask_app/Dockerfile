# Flask API docker file
# Uses apline as base for smallest image
FROM python:3-alpine
LABEL maintainer="brendan-mccheese"
LABEL purpose="Hanzo SRE task"

WORKDIR /flask_app

# Install dependencies first to allow for seperate image layer for faster local rebuilds
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt 

# Copy everything else
COPY . .
EXPOSE 8000

# Image uses gunicorn for production-ready HTTP serving
CMD ["gunicorn", "-b", "0.0.0.0:8000", "main"]