#!/bin/bash

yum install python
mkdir /Django
cd /Django ; pip install django 1.11.25
echo "Enter the name of your project"
read "project"
django-admin startproject $project


function dockerfile(){

from="python 3.7"
echo "FROM $from" > /Django/Dockerfile
echo "Enter the Name of MAINTAINER :"
read MAINTAIN
echo "MAINTAINER $MAINTAIN" >>  /Django/Dockerfile
echo "Enter Expose port : "
read port
echo "port $port" >>  /Django/Dockerfile
install="pip install --upgrade pip && pip install django==2.1.9"
echo "RUN $install" >>  /Django/Dockerfile
cmd="["python3", "manage.py", "runserver","0.0.0.0:8000"]"
echo "CMD $cmd" >>  /Django/Dockerfile

}
