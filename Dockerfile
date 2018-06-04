FROM ubuntu
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN sh -c 'curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -'
RUN apt-get install nodejs git -y
RUN git clone https://github.com/cowbell/sharedrop.git
RUN cd /sharedrop
RUN ln -s /usr/bin/nodejs /usr/sbin/node
RUN npm install -g npm
RUN npm install -g ember-cli
RUN ember install
RUN cp .env{.sample,}
RUN npm run dev

EXPOSE 3002
WORKDIR /sharedrop