FROM ubuntu

RUN apt-get update && apt-get install -y build-essential firefox ruby-full xvfb
RUN gem install bundler
RUN gem install headless
COPY test.rb ./test.rb
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle update
RUN bundle install
ENTRYPOINT ["ruby", "test.rb"]
