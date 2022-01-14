## Essa imagem é baseada no Ubuntu com o Python (muito reduzido).
FROM python:3.8.12-alpine3.15

## Atualização de pacotes atuais e instalação de pacotes necessários para instalação das libs Python3.8
RUN apk add dbus make python3-dev py3-pip   \
        libpq-dev py3-pandas py3-numpy py3-sqlalchemy py3-psycopg2 py3-schedule  && rm -rf /var/cache/apk/*

## Atualização do PIP
## RUN /usr/bin/python3 -m pip install --upgrade pip

## Diretório base de trabalho da app
WORKDIR /usr/src/app

## Instalação das Libs Python
COPY requirements.txt ./
RUN /usr/bin/pip install --no-cache-dir -r requirements.txt && rm -rf /root/.cache/pip/*

## Copia do App
ADD . /usr/src/app

## Executando a Aplicação.
CMD [ "/usr/bin/python3", "./main_schedule.py" ]