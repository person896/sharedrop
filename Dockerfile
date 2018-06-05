FROM centos:7.2.1511

ENV PATH /opt/node-v9.9.0/bin:$PATH

RUN useradd sharedrop

RUN yum install -y git \
&& yum install -y wget

RUN wget -P /opt http://nodejs.org/dist/v9.9.0/node-v9.9.0.tar.gz \
&& cd /opt \
&& tar xzvf node-v* && cd node-v* \
&& yum install -y gcc gcc-c++ \
&& ./configure \
&& make

RUN make install

RUN chown -Rf sharedrop:sharedrop /opt

USER sharedrop

RUN cd /opt \
&& git clone https://github.com/cowbell/sharedrop.git

RUN cd /opt/sharedrop \
&& npm install 

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