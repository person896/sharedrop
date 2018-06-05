FROM centos:7.2.1511

RUN yum install -y git \
&& yum install -y epel-release \
&& yum install -y nodejs

RUN cd / \
&& git clone https://github.com/cowbell/sharedrop.git

RUN cd /snapdrop && npm install -g npm
RUN cd /snapdrop && npm install -g ember-cli
RUN cd /snapdrop && npm install && ember install
RUN cd /snapdrop && cp .env{.sample,}

WORKDIR /sharedrop

CMD [ "bash", "start.sh" ]