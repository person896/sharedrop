FROM centos:7.2.1511

ENV PATH /opt/node-v6.9.4-linux-x64/bin:$PATH

RUN useradd sharedrop

RUN yum install -y epel-release \
&& yum install -y git \
&& yum install -y wget

ADD https://nodejs.org/dist/v6.9.4/node-v6.9.4-linux-x64.tar.xz /opt

RUN chown -Rf sharedrop:sharedrop /opt

USER sharedrop

RUN cd /opt \
&& tar -xvf node-v6.9.4-linux-x64.tar.xz
RUN cd /opt \
&& rm -f node-v6.9.4-linux-x64.tar.xz

RUN cd /opt \
&& git clone https://github.com/cowbell/sharedrop.git

RUN cd /opt/sharedrop \
&& npm install -g npm

RUN cd /opt/sharedrop \
&& npm install \

RUN cd /opt/sharedrop \
&& nvm install 8.10.0

RUN cd /opt/sharedrop \
&& npm install -g npm

RUN cd /opt/sharedrop \
&& npm install -g ember-cli

RUN cd /opt/sharedrop \
&& ember install

RUN cd /opt/sharedrop \
&& cp .env{.sample,}

RUN cd /opt/sharedrop \
&& npm run dev

USER root

EXPOSE 80

WORKDIR /opt/sharedrop