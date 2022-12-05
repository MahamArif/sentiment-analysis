FROM python:3.8-slim-buster

WORKDIR /app

RUN apt-get update && apt-get install -y unzip

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

RUN mkdir /model

COPY data.zip ./data.zip
COPY contractions.csv ./contractions.csv
COPY train_cnn.py ./train_cnn.py
RUN unzip data.zip

CMD python -W ignore train_cnn.py