FROM python:3

RUN apt-get update && apt-get -y install \
    libpq-dev

WORKDIR /app
ADD    ./requirements.txt   /app/
RUN    pip install -r requirements.txt
RUN    git clone https://github.com/pio500/django_for_docker-compose.git

ADD    ./django_for_docker-compose/djangosample   /app/djangosample/
ADD    ./django_for_docker-compose/manage.py      /app/

CMD ["python", "manage.py", "runserver", "0:8000"]

