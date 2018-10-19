# ruby
#
# VERSION               0.0.1

FROM      gendosu/ruby:2.3.8-alpine

MAINTAINER Gen Takahashi "gendosu@gmail.com"

ENV PATH "/root/.ndenv/shims:/root/.ndenv/bin:/products/node_modules/.bin:$PATH"

RUN apk add --update \
    curl \
    git \
    fontconfig \
    imagemagick \
    chromium-chromedriver \
&&  rm -rf /var/cache/apk/*

# Install ja-font
COPY fonts.conf /root/.config/fontconfig/
COPY ipag.ttc /root/.local/share/fonts/
RUN fc-cache -fv

RUN echo gentest >> /etc/profile

RUN git clone https://github.com/riywo/ndenv ~/.ndenv
RUN echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> /etc/bash.bashrc
RUN echo 'eval "$(ndenv init -)"' >> /etc/bash.bashrc
RUN /bin/bash -c "source /etc/bash.bashrc" \
&&  git clone https://github.com/riywo/node-build.git $($HOME/.ndenv/bin/ndenv root)/plugins/node-build \
&&  $HOME/.ndenv/bin/ndenv install v8.11.3 \
&&  $HOME/.ndenv/bin/ndenv global v8.11.3

