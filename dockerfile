from ruby:2.6.9
ADD ./ "/online-cv"
EXPOSE 4000
ENTRYPOINT ["jekyll", "serve", "--host", "0.0.0.0"]

# ==== SETUP ===

RUN apt update
RUN wget https://nodejs.org/dist/v10.24.1/node-v10.24.1-linux-x64.tar.xz
RUN tar -xvf ./node-v10.24.1-linux-x64.tar.xz
ENV PATH="/node-v10.24.1-linux-x64/bin/:${PATH}"

RUN gem install bundler -v '~> 1.16.1'

WORKDIR /online-cv
RUN rm -rf ./node_modules
RUN npm install
RUN bundle install
