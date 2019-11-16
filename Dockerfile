# first stage build
FROM ruby:2.6.3-alpine as builder
RUN apk --update add --virtual build-dependencies \
    build-base \
    curl-dev \
    mysql-dev \
    yarn \
    imagemagick \
    nodejs \
    linux-headers
RUN gem install bundler
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
ENV BUNDLE_JOBS="4"
RUN bundle install
RUN apk del build-dependencies

# final stage build
FROM ruby:2.6.3-alpine
ENV LANG="ja_JP.UTF-8" \
    TZ="Asia/Tokyo" \
    APP_ROOT="/idea-note"
RUN apk --update add \
    bash \
    nodejs \
    mysql-dev \
    yarn \
    imagemagick \
    tzdata \
    make \
    nasm \
    build-base

RUN gem install bundler

WORKDIR /tmp
COPY --from=builder /usr/local/bundle /usr/local/bundle

RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

COPY . $APP_ROOT
RUN rm -f tmp/pids/server.pid

VOLUME $APP_ROOT/public
VOLUME $APP_ROOT/tmp
EXPOSE  3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
