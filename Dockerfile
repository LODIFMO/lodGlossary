FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y npm
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install
RUN npm cache clean -f
RUN npm install -g n
RUN n 7.2.0
RUN ln -sf /usr/local/n/versions/node/7.2.0/bin/node /usr/bin/node
RUN apt-get install -y npm
RUN cd /app && npm install
RUN npm install -g elm
RUN cd /app && elm-package install -y
