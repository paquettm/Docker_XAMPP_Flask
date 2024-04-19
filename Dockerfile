# This Dockerfile creates a container with Apache2, Python3 and Flask

# Start from the latest Debian base image
FROM debian:latest

RUN apt-get update && apt-get install -y lsb-release && apt-get clean all
RUN apt-get install -y apache2
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y libapache2-mod-wsgi-py3

# Copy the flask app Apache configuration
COPY flask_app/Flask_Apache.conf /etc/apache2/sites-available/Flask_Apache.conf
#copy the wsgi configuration
COPY flask_app/flaskapp.wsgi /var/www/FlaskApp/flaskapp.wsgi
#copy the flask app
COPY flask_app/__init.py /var/www/FlaskApp/__init.py

# Expose ports 80 and 443 for Nginx
EXPOSE 80
EXPOSE 443

CMD a2ensite Flask_Apache && \
    apache2 -f /etc/apache2/apache2.conf -k stop && \
    service apache2 reload && \
    apache2 -f /etc/apache2/apache2.conf -k start
