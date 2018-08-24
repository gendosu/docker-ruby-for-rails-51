# 本体
#
# VERSION               0.0.1

FROM      gendosu/ruby-for-rails:2.3.4

MAINTAINER Gen Takahashi "gendosu@gmail.com"

ENV PATH "/root/.ndenv/shims:/root/.ndenv/bin:/products/node_modules/.bin:$PATH"

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
&&  sudo apt-get install -y nodejs chromedriver

RUN apt-get update \
&&  apt-get install yarn

RUN git clone https://github.com/riywo/ndenv ~/.ndenv
RUN echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> /etc/bash.bashrc
RUN echo 'eval "$(ndenv init -)"' >> /etc/bash.bashrc
RUN /bin/bash -c "source /etc/bash.bashrc" \
&&  git clone https://github.com/riywo/node-build.git $($HOME/.ndenv/bin/ndenv root)/plugins/node-build \
&&  $HOME/.ndenv/bin/ndenv install v5.12.0 \
&&  $HOME/.ndenv/bin/ndenv global v5.12.0

