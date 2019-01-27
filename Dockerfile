FROM python:2.7.15-jessie
 
WORKDIR /
RUN apt-get -y update && \
  apt-get -y install git && \
  git clone https://github.com/asciimoo/searx.git && \
  cd searx && \
  pip install -r requirements.txt && \
  sed -i "s/ultrasecretkey/`openssl rand -hex 16`/g" searx/settings.yml

EXPOSE 8888

CMD ["python /searx/searx/webapp.py"]
