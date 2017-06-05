FROM ubuntu:16.04

ADD hello.py /.

RUN \
  apt-get -qq update && \
  apt-get -qq -y install curl && \
  apt-get install apt-transport-https && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql.list 

RUN apt-get update
RUN ACCEPT_EULA=Y apt-get -y install msodbcsql mssql-tools 
RUN apt-get install -y tdsodbc unixodbc-dev
RUN apt-get install locales
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN pip install pyodbc 
RUN pip install neo4j-driver
CMD [ "python", "./hello.py" ]