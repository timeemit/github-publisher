FROM ruby:2.4

WORKDIR /usr/src
EXPOSE 4567
COPY . .
RUN bundle install
CMD ruby serve.rb -e 0.0.0.0
