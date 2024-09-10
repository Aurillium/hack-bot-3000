FROM python:3.12-slim-bookworm

RUN mkdir app
WORKDIR /app

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80
CMD [ "uwsgi", "--http", "0.0.0.0:80", "--master", "-p", "4", "-w", "hackbot:app" ]
