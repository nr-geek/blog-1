FROM ruby:2.5.1
RUN apt-get update

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile /app/
COPY Gemfile.lock /app/
COPY vendor /app/vendor
RUN bundle install