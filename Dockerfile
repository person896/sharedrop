FROM centos:7.2.1511

RUN yum install -y epel-release \
&& yum install nodejs \
&& yum install npm \
&& yum install -y git \
&& git clone https://github.com/cowbell/sharedrop.git \
&& cd sharedrop \
&& npm install -g ember-cli \
&& ember install \
&& cp .env{.sample,} \
&& npm run dev

EXPOSE 80