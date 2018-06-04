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
&& tar -xvf node-v6.9.4-linux-x64.tar.xz \
&& rm -f node-v6.9.4-linux-x64.tar.xz \
&& git clone https://github.com/cowbell/sharedrop.git

RUN cd /opt/sharedrop \
&& npm install \ 
&& npm install -g ember-cli \
&& ember install \
&& cp .env{.sample,} \
&& npm run dev

USER root

EXPOSE 80

WORKDIR /opt/sharedrop