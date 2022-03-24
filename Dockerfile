FROM ruby:2.6.6-alpine

ENV APP_PATH /var/app
ENV BUNDLE_VERSION 2.1.4
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV TMP_PATH /tmp/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# setup dependencies for rails
RUN apk -U add --no-cache \
build-base \
libc6-compat \
git \
mysql-dev \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
tzdata \
less \
&& rm -rf /var/cache/apk/* \
&& mkdir -p $APP_PATH

RUN gem install bundler --version "$BUNDLE_VERSION" && rm -rf $GEM_HOME/cache/*

WORKDIR $APP_PATH

EXPOSE $RAILS_PORT

ENTRYPOINT ["bundle", "exec"]