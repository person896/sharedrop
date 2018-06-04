FROM centos:7.2.1511

RUN yum update
RUN yum install -y epel-release
RUN yum install -y curl
RUN yum install -y php-curl
RUN sh -c 'curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash -'
RUN yum install -y nodejs
RUN yum install -y git
RUN git clone https://github.com/cowbell/sharedrop.git
RUN cd sharedrop
RUN npm install -g ember-cli
RUN ember install
RUN cp .env{.sample,}
RUN npm run dev

EXPOSE 80