# ruby
#
# VERSION               0.0.1

FROM      gendosu/ruby:alpine

MAINTAINER Gen Takahashi "gendosu@gmail.com"

RUN apk add --update \
    fontconfig \
    imagemagick \
&&  rm -rf /var/cache/apk/*

# Install ja-font
COPY fonts.conf /root/.config/fontconfig/
COPY ipag.ttc /root/.local/share/fonts/
RUN fc-cache -fv
