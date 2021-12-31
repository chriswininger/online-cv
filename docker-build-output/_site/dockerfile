from ruby:2.6.9
ADD ./ "/online-cv"
EXPOSE 4000
ENTRYPOINT ["/online-cv/buildScripts/docker-start.sh"]
VOLUME [/pdf-output, /build-output]

# ==== SETUP =====

# === make sure entry point is executable
RUN chmod +x /online-cv/buildScripts/docker-start.sh

# === unpack third-party binaries
WORKDIR /online-cv/third-party
RUN tar -xvf ./phantomjs-2.1.1-linux-x86_64.tar.bz2
ENV PATH="/online-cv/third-party/phantomjs-2.1.1-linux-x86_64/bin:${PATH}"

RUN tar -xvf ./node-v10.24.1-linux-x64.tar.xz
ENV PATH="/online-cv/third-party/node-v10.24.1-linux-x64/bin/:${PATH}"

# === Install npm dependencies
WORKDIR /online-cv
RUN rm -rf ./node_modules
RUN npm install

# === Install Ruby dependencies
RUN gem install bundler -v '~> 1.16.1'
RUN bundle install

### Make sure generated css is up to date
RUN ./node_modules/.bin/lessc ./assets/less/default/styles.less ./assets/less/css/styles.css
RUN mv ./assets/less/css/styles.css ./assets/css/styles.css
