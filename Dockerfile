FROM centos:7.2.1511

ENV PATH /opt/node-v6.9.4-linux-x64/bin:$PATH

RUN useradd sharedrop

RUN yum install -y epel-release \
&& yum install -y git \
&& yum install -y wget

RUN wget -P /opt https://nodejs.org/dist/v6.9.4/node-v6.9.4-linux-x64.tar.xz

RUN chown -Rf sharedrop:sharedrop /opt

USER sharedrop

RUN tar -xvf /opt/node-v6.9.4-linux-x64.tar.xz
RUN rm -f /opt/node-v6.9.4-linux-x64.tar.xz

RUN cd /opt\
&& git clone https://github.com/cowbell/sharedrop.git
&& cd /opt/sharedrop
&& npm install
&& npm install -g ember-cli
&& ember install
&& cp .env{.sample,}
RUN npm run dev

EXPOSE 80

WORKDIR /opt/sharedrop