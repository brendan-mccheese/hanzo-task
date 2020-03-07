FROM python:3-alpine

WORKDIR /flask_app

COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

COPY . .
EXPOSE 8000

CMD ["gunicorn", "-b", "0.0.0.0:8000", "main"]