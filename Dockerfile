## Essa imagem é baseada no Ubuntu com o Python (muito reduzido).
FROM debian:stable

## Atualização de pacotes atuais e instalação de pacotes necessários para instalação das libs Python3.8
RUN apt update -y && apt upgrade -y && apt install -y python3 pip gawk dbus libgpgme-dev  \
     libgpgmepp-dev libgpgmepp6 gpg gpgv1 gpgv2 libgpgmepp6 libqgpgme7 python3-gpg swig  \
     cups libcupsimage2-dev libcupsfilters-dev libfontembed-dev  libpappl-dev libvirt-dev  \
     libvirtodbc0 python3-libvirt libvirt-clients dbconfig-pgsql libpq-dev python3-cairo-dev

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