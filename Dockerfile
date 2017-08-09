FROM ruby:2.4-alpine

RUN apk add --update --virtual build-dependencies \
  build-base \
  ruby-dev \
  && apk add --update libstdc++ \
  sqlite-dev \
  && gem install mailcatcher --no-rdoc --no-ri \
  && apk del build-dependencies

EXPOSE 1080 1025

CMD ["mailcatcher", "--ip=0.0.0.0", "--foreground"]
