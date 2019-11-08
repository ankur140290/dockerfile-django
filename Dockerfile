FROM python:3.6.8-slim-stretch
MAINTAINER Ankur Agarwal <ankur140290@gmail.com>

#Install nginx, curl, mysqlclient, pip, wheel, uwsgi
RUN apt-get update \
    && apt-get install -y nginx curl vim build-essential default-libmysqlclient-dev \
    && python -m pip install pip --upgrade \
    && python -m pip install wheel \
    && pip install requests uwsgi circus

#Set Working Dir
WORKDIR /var/www/src/

#Copy Code
COPY . .
RUN mkdir /var/log/django \
    && mkdir /var/log/uwsgi \
    && touch /var/log/django/debug.log \
    && touch /var/log/uwsgi/uwsgi.log \
    && cp docker_configs/default /etc/nginx/sites-available/

#Install Requirement.txt
RUN pip install -r requirements.txt
RUN python manage.py migrate

EXPOSE 80
# Start nginx & uwsgi on startup
CMD ["/usr/local/bin/circusd","docker_configs/circus.conf"]