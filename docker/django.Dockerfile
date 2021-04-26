FROM python:3.8-buster

ENV PYTHONUNBUFFERED 1

COPY api /api

WORKDIR /api

RUN pip3 install --upgrade pip

RUN pip3 install -r requirements.txt
