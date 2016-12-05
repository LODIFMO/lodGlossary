FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN ap-get install -y npm
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD app.rb /app/app.rb
ADD package.json /app/package.json
RUN bundle install
ADD . /app
