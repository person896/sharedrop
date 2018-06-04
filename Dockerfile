FROM centos:7.2.1511

RUN useradd sharedrop

RUN yum install -y epel-release
RUN yum install -y git

RUN wget -P /opt https://nodejs.org/dist/v6.9.4/node-v6.9.4-linux-x64.tar.xz
RUN chown -Rf sharedrop:sharedrop /opt

USER sharedrop

RUN cd /opt
RUN tar -xvf node-v6.9.4-linux-x64.tar.xz
RUN rm -f node-v6.9.4-linux-x64.tar.xz

RUN git clone https://github.com/cowbell/sharedrop.git
RUN cd /opt/sharedrop
RUN npm install
RUN npm install -g ember-cli
RUN ember install
RUN cp .env{.sample,}
RUN npm run dev

EXPOSE 80

WORKDIR /opt/sharedrop