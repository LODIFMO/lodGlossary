FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y npm
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD app.rb /app/app.rb
ADD package.json /app/package.json
RUN bundle install
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN ln -sf /usr/local/n/versions/node/7.2.0/bin/node /usr/bin/node
RUN apt-get install -y npm
RUN npm install --global yarn
RUN cd /app && yarn install
RUN yarn global add elm
RUN yarn global add foreman
RUN cd /app && elm install
ADD . /app
