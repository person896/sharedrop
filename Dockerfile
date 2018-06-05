FROM centos:7.2.1511

ENV PATH /opt/node-v9.9.0-linux-x64/bin:$PATH

USER root

RUN yum install -y git \
&& yum install -y epel-release

ADD https://nodejs.org/dist/v9.9.0/node-v9.9.0-linux-x64.tar.xz /opt \

RUN cd /opt \
  && tar -xvf node-v9.9.0-linux-x64.tar.xz

RUN cd /opt \
&& git clone https://github.com/cowbell/sharedrop.git

RUN cd /opt/sharedrop \
&& yum install -y npm \
&& npm install 

RUN cd /opt/sharedrop \
&& npm install -g ember-cli

RUN cd /opt/sharedrop \
&& ember install

RUN cd /opt/sharedrop \
&& cp .env{.sample,}

RUN cd /opt/sharedrop \
&& npm run dev

EXPOSE 80

WORKDIR /opt/sharedrop