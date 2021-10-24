# docker build -t brandnewbox/bnb-ruby:2.6.6-postgresql -f 2.6/postgresql/Dockerfile .
# docker push brandnewbox/bnb-ruby:2.6.6-postgresql
FROM ruby:2.6.6-alpine3.13

# Location of the STI scripts inside the image
LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i

# https://github.com/alim/alpine-rails/blob/master/Dockerfile
ENV APP_ROOT=/app \
    BUILD_PACKAGES="curl-dev ruby-dev build-base bash" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev git shared-mime-info" \
    RUBY_PACKAGES="ruby-json yaml nodejs yarn" \
    IMAGEMAGICK_PACKAGES="imagemagick=6.9.6.8-r1 imagemagick-c++=6.9.6.8-r1 imagemagick-dev=6.9.6.8-r1"

# Hoops to install RMagick
# https://wordsandmagic.com/2017/09/cant-install-rmagick-2.16.0.-cant-find-magickwand.h./
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' >> /etc/apk/repositories

# Update and install base packages and nokogiri gem that requires a
# native compilation
RUN apk update \
    && apk upgrade \
    && apk add --update \
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES \
    $IMAGEMAGICK_PACKAGES \
    && rm -rf /var/cache/apk/*

WORKDIR ${APP_ROOT}

# This isn't anything special other 
# than it skips some of docker's internal
# file stuffs, which cut our write
# speeds in half. - NCC @ BNB - 11/2017
VOLUME /tmp/artifacts

# 3.6 adds support for yarn
RUN apk add --update yarn && rm -rf /var/cache/apk/*

RUN apk add --update postgresql-dev && rm -rf /var/cache/apk/*
