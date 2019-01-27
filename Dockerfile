FROM python:2.7.15-jessie
 
WORKDIR /
RUN apt -y update && \
  apt -y install git && \
  git clone https://github.com/asciimoo/searx.git && \
  cd searx && \
  pip install -r requirements.txt && \
  sed -i "s/ultrasecretkey/`openssl rand -hex 16`/g" searx/settings.yml

WORKDIR /searx/

EXPOSE 8888

CMD ["python searx/webapp.py"]
