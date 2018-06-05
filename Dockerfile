FROM centos:7.2.1511

ENV PATH /opt/node-v9.9.0-linux-x64/bin:$PATH

RUN useradd sharedrop

RUN yum install -y git \

ADD https://nodejs.org/dist/v6.9.4/node-v9.9.0-linux-x64.tar.xz /opt \
&& cd /opt \
&& tar --strip-components 1 -xzvf node-v9.9.0-linux-x64.tar.xz

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