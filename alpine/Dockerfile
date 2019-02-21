# ruby
#
# VERSION               0.0.1

FROM      gendosu/ruby:2.3.8-alpine

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

RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv
RUN echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> /etc/bash.bashrc
RUN echo 'eval "$(nodenv init -)"' >> /etc/bash.bashrc
RUN /bin/bash -c "source /etc/bash.bashrc" \
  &&  git clone https://github.com/nodenv/node-build.git "$($HOME/.nodenv/bin/nodenv root)"/plugins/node-build \
  &&  $HOME/.nodenv/bin/nodenv install 8.13.0 \
  &&  $HOME/.nodenv/bin/nodenv global 8.13.0

