FROM python:3
WORKDIR /aws-cicd
COPY ./requirements.txt
RUN pip3 install --default-timeout=100 --max-concurrent-downloads=20 -r requirements.txt
COPY . .
