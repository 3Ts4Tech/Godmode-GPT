FROM python:3.11-slim-bullseye

WORKDIR /app
COPY requirements-docker.txt /app

RUN pip install -r requirements-docker.txt
EXPOSE 8080

COPY autogpt/ /app/autogpt
COPY gunicorn.conf.py /app
COPY credentials/ /app/credentials

ENV PORT 8080
ENV HOST 0.0.0.0

CMD ["gunicorn" , "-c", "gunicorn.conf.py" , "--timeout", "800", "autogpt.api:app"]
