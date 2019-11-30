#!/bin/bash

yum install python
mkdir /Django
cd /Django
python3 -m venv project_venv
source project_venv/bin/activate
echo "Enter the Django version you want to install :"
read Version
pip install Django==1.11.26
echo "Enter the name of your project"
read "project"
django-admin startproject $project
sed '28 s/ALLOWED_HOSTS =/ALLOWED_HOSTS = [0.0.0.0:8000]/g' /Django/'$Project'/'$project'/settings.py



from="python:3.7"
echo "FROM $from" > /Django/Dockerfile
echo "Enter the Name of MAINTAINER :"
read MAINTAIN
echo "MAINTAINER $MAINTAIN" >>  /Django/Dockerfile
echo "RUN mkdir /code" >> /Django/Dockerfile
echo "RUN cd /code" >> /Django/Dockerfile
echo "RUN python3 -m venv project_venv" >> /Django/Dockerfile
path='./'$project''
echo "COPY $path /code" >> /Django/Dockerfile
echo "RUN source project_venv/bin/activate" >> /Django/Dockerfile
echo "Enter Expose port : "
read port
echo "EXPOSE $port" >> /Django/Dockerfile
echo "WORKDIR /code"
install="pip install --upgrade pip && pip install django==$Version"
echo "RUN $install" >>  /Django/Dockerfile
cmd="["python3", "manage.py", "runserver","0.0.0.0:8000"]"
echo "CMD $cmd" >>  /Django/Dockerfile

