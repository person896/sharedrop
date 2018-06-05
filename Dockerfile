FROM centos:7.2.1511

RUN yum install -y git \
&& yum install -y epel-release \
&& yum install -y nodejs

RUN cd / \
&& git clone https://github.com/cowbell/sharedrop.git

RUN cd /sharedrop
RUN npm install -g npm
RUN npm install -g ember-cli
RUN npm install && ember install
RUN cp .env{.sample,}

WORKDIR /sharedrop

CMD [ "bash", "start.sh" ]