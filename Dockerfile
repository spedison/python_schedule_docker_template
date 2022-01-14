## Essa imagem é baseada no Ubuntu com o Python (muito reduzido).
FROM python:3.8.12-alpine3.15

## Atualização de pacotes atuais e instalação de pacotes necessários para instalação das libs Python3.8
RUN apk add gawk dbus make python3-dev py3-wheel py3-pip libedit-dev make cmake \
    swig openblas-dev blas-dev blas openblas-ilp64 py-cryptography g++ gcc  \
    lapack-dev libpq-dev py3-cairo py3-cairo-dev

## Atualização do PIP
## RUN /usr/bin/python3 -m pip install --upgrade pip

## Diretório base de trabalho da app
WORKDIR /usr/src/app

## Instalação das Libs Python
COPY requirements.txt ./
RUN /usr/bin/pip install -r requirements.txt

## Copia do App
ADD . /usr/src/app

## Executando a Aplicação.
CMD [ "/usr/bin/python3", "./main_schedule.py" ]