FROM python:3.9.0

WORKDIR /home/

RUN echo "askljdgl"

RUN git clone https://github.com/sun-hani/gis_2021.git

WORKDIR /home/gis_2021/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=gis_001.settings.deploy && python manage.py migrate --settings=gis_001.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gis_001.settings.deploy gis_001.wsgi --bind 0.0.0.0:8000"]