from ruby:2.6.9
ADD ./ "/online-cv"
EXPOSE 4000
ENTRYPOINT ["/online-cv/buildScripts/docker-start.sh"]
VOLUME [/pdf-output, /build-output]

# ==== SETUP =====
#RUN apt update
RUN wget https://nodejs.org/dist/v10.24.1/node-v10.24.1-linux-x64.tar.xz
RUN tar -xvf ./node-v10.24.1-linux-x64.tar.xz
RUN chmod +x /online-cv/buildScripts/docker-start.sh
ENV PATH="/node-v10.24.1-linux-x64/bin/:${PATH}"

RUN gem install bundler -v '~> 1.16.1'

WORKDIR /online-cv/third-party
RUN tar -xvf ./phantomjs-2.1.1-linux-x86_64.tar.bz2
ENV PATH="/online-cv/third-party/phantomjs-2.1.1-linux-x86_64/bin:${PATH}"

WORKDIR /online-cv
RUN rm -rf ./node_modules
RUN npm install
RUN bundle install
