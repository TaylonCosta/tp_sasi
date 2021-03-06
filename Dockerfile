FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update -y

RUN apt-get -y install binutils libproj-dev gdal-bin
RUN apt-get -y install libjpeg-dev
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install rabbitmq-server

RUN mkdir /code
WORKDIR /code
ADD ./code/requirements.txt /code/
RUN pip install --upgrade pip
RUN apt-get -y install unixodbc-dev
RUN pip install -r requirements.txt
RUN pip install ipython
RUN pip install redis
RUN pip install celery
RUN pip install flower
RUN pip install gunicorn

#
# RUN apt-get update && apt-get install -y firefox-esr
# RUN apt-get install -y xvfb xserver-xephyr xfonts-base
#
# RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
# RUN tar -x geckodriver -zf geckodriver-v0.26.0-linux64.tar.gz -O > /usr/bin/geckodriver
# RUN chmod +x /usr/bin/geckodriver
# RUN rm geckodriver-v0.26.0-linux64.tar.gz