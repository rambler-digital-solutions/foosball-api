FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

ENV app /foosball-api

RUN mkdir $app

ADD Gemfile $app/Gemfile
ADD Gemfile.lock $app/Gemfile.lock

WORKDIR $app

RUN RAILS_ENV=production bundle install --deployment --jobs 4

ADD . $app
