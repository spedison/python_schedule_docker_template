## Essa imagem é baseada no Ubuntu com o Python (muito reduzido).
FROM python:3.8.12-alpine3.15

## Atualização de pacotes atuais e instalação de pacotes necessários para instalação das libs Python3.8
RUN apk add gawk dbus llvm11-libs llvm11-dev llvm11-static llvm11 libedit libedit-dev make cmake  \
    postgresql12-plpython3 python3-dev rust py3-wheel libjpeg-turbo-dev openjpeg-dev  \
    freetype freetype-dev freetype-static gpgme-dev py3-pip \
    gpgmepp swig openblas-dev blas-dev blas openblas-ilp64 py-cryptography \
    java-hdf5 hdf5-dev hdf5-fortran hdf5-static gnuplot py3-matplotlib \
    openblas-static openblas lapack lapack-dev gfortran g++ gcc  \
    musl-dev libffi-dev openssl-dev py3-libvirt libvirt-glib-lang libvirt-dev \
    gfortran musl-dev lapack-dev libxslt-dev libxml2 py3-libxml2\
    cups cups-filters-dev cups-dev cups-filters-libs \
    apr-util-dbd_pgsql libpq-dev py3-cairo py3-cairo-dev

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