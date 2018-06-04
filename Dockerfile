FROM centos:7.2.1511

RUN yum install -y epel-release
RUN yum install nodejs
RUN yum install npm
RUN yum install -y git
RUN git clone https://github.com/cowbell/sharedrop.git
RUN cd sharedrop
RUN npm install -g ember-cli
RUN ember install
RUN cp .env{.sample,}
RUN npm run dev

EXPOSE 80