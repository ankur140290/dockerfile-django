## nginx <=> uwsgi <=> django + circus
Create Docker from pyhton 3.6.8 and host django 2.2.5 using circus, nginx and wsgi on linux system.

### Prerequisite
* Docker installed on your system

### Getting started
1) Download repo.
2) Copy all contents to your root folder
3) Update Dokerfile, and files in docker_configs folder as per req
4) Update .dockerignore file to exclude files from going to docker image

### Running docker
To create docker image:
> docker image build -t <dokername>:<tagname> .
>eg. sudo docker image build -t bulletinboard:1.0 .

To run docker:
> sudo docker run <dokername>:<tagname>