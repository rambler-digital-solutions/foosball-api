FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /foosball-api
WORKDIR /foosball-api
ADD Gemfile /foosball-api/Gemfile
ADD Gemfile.lock /foosball-api/Gemfile.lock
RUN bundle install
ADD . /foosball-api
