# 本体
#
# VERSION               0.0.1

FROM      gendosu/ruby-for-rails:2.6.1

ENV PATH "/root/.ndenv/shims:/root/.ndenv/bin:/products/node_modules/.bin:$PATH"

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
  &&  sudo apt-get install -y nodejs chromedriver \
  &&  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  &&  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  &&  apt-get update \
  &&  apt-get install yarn

RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv
RUN echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> /etc/bash.bashrc
RUN echo 'eval "$(nodenv init -)"' >> /etc/bash.bashrc
RUN /bin/bash -c "source /etc/bash.bashrc" \
  &&  git clone https://github.com/nodenv/node-build.git "$($HOME/.nodenv/bin/nodenv root)"/plugins/node-build \
  &&  $HOME/.nodenv/bin/nodenv install 8.15.0 \
  &&  $HOME/.nodenv/bin/nodenv global 8.15.0

