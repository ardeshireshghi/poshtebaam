FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers python3-dev build-base pcre-dev
RUN pip install uwsgi
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["/usr/local/bin/uwsgi", "--ini", "/code/www/html/my_app/app.ini"]
CMD ["flask", "run"]
